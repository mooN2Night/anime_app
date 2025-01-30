part of 'random_anime_bloc.dart';

abstract class RandomAnimeBlocState {}

class RandomAnimeInitial extends RandomAnimeBlocState {}

class RandomAnimeBlocLoading extends RandomAnimeBlocState {}

class RandomAnimeBlocLoaded extends RandomAnimeBlocState {
  RandomAnimeBlocLoaded({
    required this.animeEntity,
  });

  final AnimeEntity animeEntity;
}

class RandomAnimeBlocError extends RandomAnimeBlocState {
  RandomAnimeBlocError({
    required this.message,
  });

  final String message;
}
