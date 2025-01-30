// import 'package:anime_app/core/constants/string_constant.dart';
// import 'package:anime_app/core/providers/size_provider.dart';
// import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/random_anime_bloc/random_anime_cubit.dart';
// import '../bloc/random_anime_bloc/random_anime_state.dart';
// import '../pages/detail_anime_page.dart';
//
// class RandomAnimeWidget extends StatelessWidget {
//   const RandomAnimeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = SizeProvider.of(context);
//
//     if (size == null) {
//       return const SizedBox.shrink();
//     }
//
//     return BlocBuilder<RandomAnimeCubit, RandomAnimeState>(
//       builder: (context, state) {
//         if (state is RandomAnimeLoading) {
//           debugPrint('RandomAnimeLoading');
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is RandomAnimeLoaded) {
//           final anime = state.animeEntity;
//           debugPrint('RandomAnimeLoaded');
//           return GestureDetector(
//             onTap: () => _navigateToDetailPage(context, anime),
//             child: Stack(
//               children: [
//                 Image.network(
//                   '${StringConstants.baseImageUrl}${anime.posters.postersOriginal.url}',
//                   width: size.screenWidth,
//                   // height: ,
//                   fit: BoxFit.fill,
//                 ),
//                 Positioned.fill(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.transparent,
//                           Colors.transparent,
//                           Colors.black.withOpacity(0.5),
//                           Colors.black.withOpacity(0.9),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 16,
//                   left: 16,
//                   right: 16,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         anime.names.ru,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 35,
//                         ),
//                       ),
//                       Text(
//                         anime.description,
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else if (state is RandomAnimeError) {
//           debugPrint('RandomAnimeError');
//           return Center(
//             child: Text(state.message),
//           );
//         } else {
//           return Container(
//             width: size.screenWidth,
//             height: size.blockSizeVertical * 30,
//             color: Colors.red,
//           );
//         }
//       },
//     );
//   }
//
//   void _navigateToDetailPage(BuildContext ctx, AnimeEntity anime) {
//     Navigator.push(
//       ctx,
//       MaterialPageRoute(
//         builder: (_) => DetailAnimePage(anime: anime),
//       ),
//     );
//   }
// }
