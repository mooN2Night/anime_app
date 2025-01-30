part of 'last_changes_bloc.dart';

abstract class LastChangesState {}

class LastChangesInitial extends LastChangesState {}

class LastChangesLoading extends LastChangesState {}

class LastChangesLoaded extends LastChangesState {
  LastChangesLoaded({
    required this.lastChangesAnimeEntity,
  });

  final LastChangesAnimeEntity lastChangesAnimeEntity;
}

class LastChangesError extends LastChangesState {
  LastChangesError({
    required this.message,
  });

  final String message;
}
