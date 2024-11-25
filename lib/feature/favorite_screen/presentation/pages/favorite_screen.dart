import 'package:anime_app/core/constants/size_constant.dart';
import 'package:anime_app/core/providers/size_provider.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  // final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final size = SizeProvider.of(context);

    if (size == null) {
      return const SizedBox.shrink();
    }

    return CustomScrollView(
      // controller: controller,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: size.screenWidth,
            height: size.blockSizeHorizontal * 5,
            color: Colors.green,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (context, index) {
                return Text(
                  'index: $index',
                  style: Theme.of(context).textTheme.titleMedium,
                );
              },
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Text(
              'SliverList.builder index: $index',
              style: Theme.of(context).textTheme.titleMedium,
            );
          },
        ),
      ],
    );
  }
}
