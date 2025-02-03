import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:anime_app/feature/main_screen/presentation/pages/detail_anime_page.dart';
import 'package:anime_app/feature/main_screen/presentation/pages/last_changes_page.dart';
import 'package:flutter/material.dart';

void navigateToDetailPage(BuildContext ctx, AnimeEntity anime) {
  Navigator.push(
    ctx,
    MaterialPageRoute(
      builder: (_) => DetailAnimePage(anime: anime),
    ),
  );
}

void navigateToLastChanges(BuildContext ctx, List<AnimeEntity> animeList) {
  Navigator.push(
    ctx,
    MaterialPageRoute(
      builder: (_) => LastChangesPage(animeList: animeList),
    ),
  );
}