import 'package:anime_app/core/constants/color_constant.dart';
import 'package:anime_app/core/constants/string_constant.dart';
import 'package:anime_app/core/providers/size_provider.dart';
import 'package:anime_app/core/providers/theme_provider.dart';
import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'episodes_anime_page.dart';

class DetailAnimePage extends StatefulWidget {
  const DetailAnimePage({super.key, required this.anime});

  final AnimeEntity anime;

  @override
  State<DetailAnimePage> createState() => _DetailAnimePageState();
}

class _DetailAnimePageState extends State<DetailAnimePage> {
  @override
  Widget build(BuildContext context) {
    final size = SizeProvider.of(context);
    final isLight = ThemeProvider.of(context).isLightTheme;

    if (size == null) {
      return const SizedBox.shrink();
    }

    debugPrint(
      widget.anime.player.episodeEntity.entries
          .map((e) => e..value.episodeImage)
          .toString(),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        IconlyLight.arrow_left_2,
                        color: isLight
                            ? ColorConstant.blackColor
                            : ColorConstant.whiteColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        IconlyLight.upload,
                        color: isLight
                            ? ColorConstant.blackColor
                            : ColorConstant.whiteColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '${StringConstants.baseImageUrl}${widget.anime.posters.postersSmall.url}',
                        height: size.blockSizeVertical * 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          _animeCharacteristics(
                            context,
                            widget.anime.type.string,
                            'Тип',
                          ),
                          const SizedBox(height: 5),
                          _animeCharacteristics(
                            context,
                            widget.anime.type.episodes.toString(),
                            'Эпизоды',
                          ),
                          const SizedBox(height: 5),
                          _animeCharacteristics(
                            context,
                            widget.anime.status.string,
                            'Статус',
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Жанр',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: widget.anime.genres.map((genre) {
                                    return Text(
                                      genre,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          _animeCharacteristics(
                            context,
                            widget.anime.season.year.toString(),
                            'Дата',
                          ),
                          const SizedBox(height: 5),
                          _animeCharacteristics(
                            context,
                            widget.anime.inFavorite.toString(),
                            'В избранном',
                          ),
                          const SizedBox(height: 5),
                          _animeCharacteristics(
                            context,
                            '~${widget.anime.type.length} мин',
                            'Длительность',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.anime.names.ru,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.anime.names.en,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.anime.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        final episodesEntity = widget
                            .anime.player.episodeEntity.entries
                            .map((e) => e.value)
                            .toList();
                        debugPrint(episodesEntity.toString());
                        return EpisodesAnimePage(episodesEntity: episodesEntity);
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Список серий',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Icon(
                        IconlyLight.arrow_right_2,
                        color: isLight
                            ? ColorConstant.blackColor
                            : ColorConstant.whiteColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _animeCharacteristics(
    BuildContext context,
    String body,
    String title,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          title == 'Дата' ? _convertSeason() : body,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  String _convertSeason() {
    final String? season = widget.anime.season.string;
    final year = widget.anime.season.year;
    if (season == null) {
      return '$year год';
    } else {
      return '$season $year года';
    }
  }
}
