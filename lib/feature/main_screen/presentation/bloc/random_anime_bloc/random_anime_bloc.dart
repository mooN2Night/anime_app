import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/map_failure_to_message.dart';
import '../../../domain/entities/anime_entity.dart';
import '../../../domain/use_cases_impl/get_random_anime.dart';

part 'random_anime_bloc_state.dart';

part 'random_anime_bloc_event.dart';

class RandomAnimeBloc
    extends Bloc<RandomAnimeBlocEvent, RandomAnimeBlocState> {
  final GetRandomAnimeUseCase _getRandomAnimeUseCase;

  RandomAnimeBloc(this._getRandomAnimeUseCase)
      : super(RandomAnimeInitial()) {
    on<LoadRandomAnime>((event, emit) async {
      final failureOrAnime = await _getRandomAnimeUseCase.getRandomAnime();

      failureOrAnime.fold(
        (error) => emit(
          RandomAnimeBlocError(
            message: mapFailureToMessage(error),
          ),
        ),
        (anime) => emit(
          RandomAnimeBlocLoaded(animeEntity: anime),
        ),
      );
    });
  }
}
