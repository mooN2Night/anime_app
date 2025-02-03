import 'package:anime_app/feature/main_screen/presentation/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../widgets/last_updates_widget.dart';
import '../widgets/random_anime_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: RandomAnimeWidget(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 260,
            child: LastUpdatesWidget(),
          ),
        ),
      ],
    );
  }
}
