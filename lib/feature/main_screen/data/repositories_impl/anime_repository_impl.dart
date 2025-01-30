import 'package:anime_app/core/error/exception.dart';
import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/feature/main_screen/data/data_sources/anime_remote_date_source.dart';
import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:anime_app/feature/main_screen/domain/entities/last_changes_entity.dart';
import 'package:anime_app/feature/main_screen/domain/repositories/anime_repository.dart';
import 'package:fpdart/src/either.dart';

import '../mapper/mapper.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  AnimeRepositoryImpl({required this.remoteDataSource, required this.mapper});

  final AnimeRemoteDataSource remoteDataSource;
  final Mapper mapper;

  @override
  Future<Either<Failure, AnimeEntity>> getRandomAnime() async {
    try {
      final remoteAnimeModel = await remoteDataSource.getRandomAnime();

      final remoteAnimeEntity = mapper.animeToEntity(remoteAnimeModel);

      return Right(remoteAnimeEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LastChangesAnimeEntity>> getLastChanges() async {
    try {
      final remoteAnimeModel = await remoteDataSource.getLastChanges();

      final remoteAnimeEntity = mapper.lastChangesAnimeModelToEntity(remoteAnimeModel);

      return Right(remoteAnimeEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
