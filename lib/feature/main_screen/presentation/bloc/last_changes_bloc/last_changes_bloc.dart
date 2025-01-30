import 'package:anime_app/core/util/map_failure_to_message.dart';
import 'package:anime_app/feature/main_screen/domain/entities/last_changes_entity.dart';
import 'package:anime_app/feature/main_screen/domain/use_cases_impl/get_last_changes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'last_changes_state.dart';

part 'last_changes_event.dart';

class LastChangesBloc extends Bloc<LastChangesEvent, LastChangesState> {
  final GetLastChangesUseCase _getLastChangesUseCase;

  LastChangesBloc(this._getLastChangesUseCase) : super(LastChangesInitial()) {
    on<LoadLastChanges>((event, emit) async {
      final failureOrAnime = await _getLastChangesUseCase.getLastChanges();

      failureOrAnime.fold(
        (error) => emit(
          LastChangesError(
            message: mapFailureToMessage(error),
          ),
        ),
        (anime) => emit(
          LastChangesLoaded(lastChangesAnimeEntity: anime),
        ),
      );
    });
  }
}
