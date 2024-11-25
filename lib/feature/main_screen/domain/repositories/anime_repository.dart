import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class AnimeRepository {
  Future<Either<Failure, AnimeEntity>> getRandomAnime();
}