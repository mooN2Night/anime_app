import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:anime_app/feature/main_screen/presentation/pages/detail_anime_page.dart';
import 'package:anime_app/feature/main_screen/presentation/pages/last_changes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/last_changes_bloc/last_changes_bloc.dart';

void navigateToDetailPage(BuildContext ctx, AnimeEntity anime) {
  Navigator.push(
    ctx,
    MaterialPageRoute(
      builder: (_) => DetailAnimePage(anime: anime),
    ),
  );
}

void navigateToLastChanges(BuildContext context, LastChangesBloc bloc) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: bloc,
        child: LastChangesPage(),
      ),
    ),
  );
}