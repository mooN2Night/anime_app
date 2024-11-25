import 'package:flutter/material.dart';

import '../../../../core/providers/size_provider.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../domain/entities/anime_entity.dart';

class EpisodesAnimePage extends StatelessWidget {
  const EpisodesAnimePage({super.key, required this.episodesEntity});

  final List<AnimeEpisodeEntity> episodesEntity;

  @override
  Widget build(BuildContext context) {
    final size = SizeProvider.of(context);
    final isLight = ThemeProvider.of(context).isLightTheme;

    if (size == null) {
      return const SizedBox.shrink();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Серии'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        itemCount: episodesEntity.length,
        itemBuilder: (context, index) {
          final episode = episodesEntity[index];
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.blockSizeHorizontal * 30,
                  height: size.blockSizeVertical * 10,
                  color: Colors.red,
                ),
                SizedBox(width: 10),
                Text(
                  episode.episodeNumber.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          );
        },
      ),
      // SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //     child: Column(
      //       children: episodesEntity.map((episode) {
      //         debugPrint(episode.episodeNumber.toString());
      //         return Container(
      //           margin: EdgeInsets.only(bottom: 20),
      //           width: double.infinity,
      //           height: 30,
      //           child: Row(
      //             children: [
      //               Text(
      //                 episode.episodeNumber.toString(),
      //                 style: Theme.of(context).textTheme.titleMedium,
      //               ),
      //             ],
      //           ),
      //         );
      //       }).toList(),
      //     ),
      //   ),
      // ),
    );
  }
}
