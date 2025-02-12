import 'package:anime_app/core/util/map_failure_to_message.dart';
import 'package:anime_app/feature/main_screen/domain/entities/last_changes_entity.dart';
import 'package:anime_app/feature/main_screen/domain/use_cases_impl/get_last_changes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/anime_entity.dart';

part 'last_changes_state.dart';

part 'last_changes_event.dart';

class LastChangesBloc extends Bloc<LastChangesEvent, LastChangesState> {
  final GetLastChangesUseCase _getLastChangesUseCase;
  int _page = 1;
  bool _isFetching = false;

  LastChangesBloc(this._getLastChangesUseCase) : super(LastChangesInitial()) {
    on<LoadLastChanges>((event, emit) async {
      if (_isFetching) return;
      _isFetching = true;

      final currentState = state;
      List<AnimeEntity> currentList = [];

      if (currentState is LastChangesLoaded) {
        currentList = List.from(currentState.lastChangesAnimeEntity.animeList);
      }

      final failureOrAnime = await _getLastChangesUseCase.getLastChanges(_page);

      failureOrAnime.fold((error) {
        _isFetching = false;
        emit(
          LastChangesError(
            message: mapFailureToMessage(error),
          ),
        );
      }, (anime) {
        _isFetching = false;
        _page++;
        debugPrint(_page.toString());
        emit(
          LastChangesLoaded(
            lastChangesAnimeEntity: LastChangesAnimeEntity(
              animeList: currentList + anime.animeList,
              pagination: anime.pagination,
            ),
          ),
        );
      });
    });
  }
}
