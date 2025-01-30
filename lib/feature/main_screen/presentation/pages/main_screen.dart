import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../widgets/last_updates_widget.dart';
import '../widgets/random_anime_widget.dart';
import '../widgets/random_anime_cubit_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: RandomAnimeWidget(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Последнии изменения',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Icon(IconlyLight.arrow_right_2),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: LastUpdatesWidget(),
          ),
        ),
      ],
    );
  }
}
