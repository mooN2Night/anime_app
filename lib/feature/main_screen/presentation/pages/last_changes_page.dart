import 'package:anime_app/core/constants/color_constant.dart';
import 'package:anime_app/core/constants/string_constant.dart';
import 'package:anime_app/core/providers/theme_provider.dart';
import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:anime_app/feature/main_screen/presentation/utils/navigator.dart';
import 'package:anime_app/feature/main_screen/presentation/utils/next_episode_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/providers/size_provider.dart';
import '../bloc/last_changes_bloc/last_changes_bloc.dart';

class LastChangesPage extends StatefulWidget {
  const LastChangesPage({super.key});

  @override
  State<LastChangesPage> createState() => _LastChangesPageState();
}

class _LastChangesPageState extends State<LastChangesPage> {
  late final ScrollController _scrollController;
  late LastChangesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _bloc = context.read<LastChangesBloc>();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<LastChangesBloc>().add(LoadLastChanges());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeProvider.of(context);
    final isLight = ThemeProvider.of(context).isLightTheme;

    if (size == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Последние изменения',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            IconlyLight.arrow_left_2,
            color:
                isLight ? ColorConstant.blackColor : ColorConstant.whiteColor,
          ),
        ),
      ),
      body: BlocBuilder<LastChangesBloc, LastChangesState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LastChangesInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LastChangesError) {
            return Center(child: Text(state.message));
          } else if (state is LastChangesLoaded) {
            final animeList = state.lastChangesAnimeEntity.animeList;

            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              itemCount: animeList.length + 1,
              itemBuilder: (context, index) {
                if (index == animeList.length) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final anime = animeList[index];
                String? nextEpisode = getNextEpisodeDate(anime);

                return GestureDetector(
                  onTap: () => navigateToDetailPage(context, anime),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            '${StringConstants.baseImageUrl}${anime.posters.postersOriginal.url}',
                            width: size.blockSizeHorizontal * 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                anime.names.ru,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (anime.player?.releasedEpisodeEntity
                                      ?.lastEpisode !=
                                  null)
                                const SizedBox(height: 5),
                              if (anime.player?.releasedEpisodeEntity
                                      ?.lastEpisode !=
                                  null)
                                Text(
                                  'Эпизодов вышло: ${anime.player?.releasedEpisodeEntity?.lastEpisode}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              const SizedBox(height: 5),
                              if (nextEpisode != null)
                                Text(
                                  'Следующая серия выйдет $nextEpisode',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              if (anime.description != '' &&
                                  anime.description != null)
                                const SizedBox(height: 5),
                              if (anime.description != '' &&
                                  anime.description != null)
                                Text(
                                  anime.description!,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
