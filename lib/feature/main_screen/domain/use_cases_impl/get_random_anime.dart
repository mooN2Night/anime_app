import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/core/params/random_anime_params.dart';
import 'package:anime_app/core/use_case/use_case.dart';
import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:anime_app/feature/main_screen/domain/repositories/anime_repository.dart';
import 'package:fpdart/src/either.dart';

class GetRandomAnimeUseCase extends UseCase<AnimeEntity, RandomAnimeParams> {
  GetRandomAnimeUseCase(this.animeRepository);

  final AnimeRepository animeRepository;

  @override
  Future<Either<Failure, AnimeEntity>> call(RandomAnimeParams params) async {
    return await animeRepository.getRandomAnime();
  }
}
