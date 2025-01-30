import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/feature/main_screen/domain/entities/last_changes_entity.dart';
import 'package:fpdart/src/either.dart';

import '../repositories/anime_repository.dart';

class GetLastChangesUseCase {
  GetLastChangesUseCase(this.animeRepository);

  final AnimeRepository animeRepository;

  Future<Either<Failure, LastChangesAnimeEntity>> getLastChanges() async {
    return await animeRepository.getLastChanges();
  }
}
