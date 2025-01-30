import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';

abstract class RandomAnimeState {
  const RandomAnimeState();
}

class RandomAnimeEmpty extends RandomAnimeState {}

class RandomAnimeLoading extends RandomAnimeState {}

class RandomAnimeLoaded extends RandomAnimeState {
  final AnimeEntity animeEntity;

  RandomAnimeLoaded({required this.animeEntity});
}

class RandomAnimeError extends RandomAnimeState {
  final String message;

  RandomAnimeError({required this.message});
}
