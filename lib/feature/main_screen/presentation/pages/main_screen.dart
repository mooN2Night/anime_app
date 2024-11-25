import 'package:flutter/material.dart';

import '../widgets/random_anime_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: RandomAnimeWidget(),
        ),
      ],
    );
  }
}
