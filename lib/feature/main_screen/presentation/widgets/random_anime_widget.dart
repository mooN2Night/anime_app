import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/constants/string_constant.dart';
import '../../../../core/providers/size_provider.dart';
import '../../domain/entities/anime_entity.dart';
import '../../domain/use_cases_impl/get_random_anime.dart';
import '../bloc/random_anime_bloc/random_anime_bloc.dart';
import '../pages/detail_anime_page.dart';

class RandomAnimeWidget extends StatefulWidget {
  const RandomAnimeWidget({super.key});

  @override
  State<RandomAnimeWidget> createState() => _RandomAnimeWidgetState();
}

class _RandomAnimeWidgetState extends State<RandomAnimeWidget> {
  final _randomAnimeBloc = RandomAnimeBloc(GetIt.I<GetRandomAnimeUseCase>());

  @override
  void initState() {
    super.initState();
    _randomAnimeBloc.add(LoadRandomAnime());
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeProvider.of(context);

    if (size == null) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<RandomAnimeBloc, RandomAnimeBlocState>(
      bloc: _randomAnimeBloc,
      builder: (context, state) {
        switch (state) {
          case RandomAnimeBlocLoaded _:
            final anime = state.animeEntity;
            return GestureDetector(
              onTap: () => _navigateToDetailPage(context, anime),
              child: Stack(
                children: [
                  Image.network(
                    '${StringConstants.baseImageUrl}${anime.posters.postersOriginal.url}',
                    width: size.screenWidth,
                    // height: ,
                    fit: BoxFit.fill,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          anime.names.ru,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          anime.description ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          case RandomAnimeBlocLoading _:
            return CircularProgressIndicator();
          case RandomAnimeInitial _:
            return Container(
              width: size.screenWidth,
              height: 70,
              color: Colors.purple,
            );
          case RandomAnimeBlocError _:
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
        }

        return Container(
          width: size.screenWidth,
          height: 70,
          color: Colors.green,
        );
      },
    );
  }

  void _navigateToDetailPage(BuildContext ctx, AnimeEntity anime) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) => DetailAnimePage(anime: anime),
      ),
    );
  }
}
