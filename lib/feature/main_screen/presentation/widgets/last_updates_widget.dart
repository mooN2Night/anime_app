import 'package:anime_app/core/providers/size_provider.dart';
import 'package:anime_app/feature/main_screen/domain/use_cases_impl/get_last_changes.dart';
import 'package:anime_app/feature/main_screen/presentation/bloc/last_changes_bloc/last_changes_bloc.dart';
import 'package:anime_app/feature/main_screen/presentation/utils/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/constants/string_constant.dart';

class LastUpdatesWidget extends StatefulWidget {
  const LastUpdatesWidget({super.key});

  @override
  State<LastUpdatesWidget> createState() => _LastUpdatesWidgetState();
}

class _LastUpdatesWidgetState extends State<LastUpdatesWidget> {
  final _lastChangesBloc = LastChangesBloc(GetIt.I<GetLastChangesUseCase>());

  @override
  void initState() {
    super.initState();
    _lastChangesBloc.add(LoadLastChanges());
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeProvider.of(context);

    if (size == null) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<LastChangesBloc, LastChangesState>(
      bloc: _lastChangesBloc,
      builder: (context, state) {
        if (state is LastChangesLoaded) {
          final animeList = state.lastChangesAnimeEntity.animeList;
          return Column(
            children: [
              GestureDetector(
                onTap: () => navigateToLastChanges(context, animeList),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Последние изменения',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Icon(IconlyLight.arrow_right_2),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: animeList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navigateToDetailPage(
                        context,
                        animeList[index],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: 120,
                            height: 145,
                            child: Image.network(
                              '${StringConstants.baseImageUrl}${animeList[index].posters.postersSmall.url}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            width: 120,
                            child: Text(
                              animeList[index].names.ru,
                              style: const TextStyle(
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        if (state is LastChangesLoading) {
          return const CircularProgressIndicator();
        }
        if (state is LastChangesInitial) {
          return Container(
            width: size.screenWidth,
            height: 70,
            color: Colors.purple,
          );
        }
        if (state is LastChangesError) {
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
}
