import 'package:anime_app/feature/main_screen/domain/use_cases_impl/get_random_anime.dart';
import 'package:anime_app/feature/main_screen/presentation/bloc/random_anime_bloc/random_anime_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomAnimeCubit extends Cubit<RandomAnimeState> {
  RandomAnimeCubit({required this.getRandomAnimeUseCase})
      : super(RandomAnimeEmpty());

  final GetRandomAnimeUseCase getRandomAnimeUseCase;

  void loadRandomAnime() async {
    if (state is RandomAnimeLoading) return;

    // final currentState = state;

    // final failureOrAnime = await getRandomAnimeUseCase(RandomAnimeParams());

    // failureOrAnime.fold(
    //   (error) => emit(
    //     RandomAnimeError(
    //       message: mapFailureToMessage(error),
    //     ),
    //   ),
    //   (anime) => emit(
    //     RandomAnimeLoaded(animeEntity: anime),
    //   ),
    // );
  }
}
