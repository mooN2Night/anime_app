import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:anime_app/feature/main_screen/domain/repositories/anime_repository.dart';
import 'package:fpdart/src/either.dart';

class GetRandomAnimeUseCase {
  GetRandomAnimeUseCase(this.animeRepository);

  final AnimeRepository animeRepository;

  Future<Either<Failure, AnimeEntity>> getRandomAnime() async {
    return await animeRepository.getRandomAnime();
  }
}
