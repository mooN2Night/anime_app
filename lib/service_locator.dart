import 'package:anime_app/feature/main_screen/data/data_sources/anime_remote_date_source.dart';
import 'package:anime_app/feature/main_screen/data/mapper/mapper.dart';
import 'package:anime_app/feature/main_screen/data/repositories_impl/anime_repository_impl.dart';
import 'package:anime_app/feature/main_screen/domain/repositories/anime_repository.dart';
import 'package:anime_app/feature/main_screen/domain/use_cases_impl/get_random_anime.dart';
import 'package:anime_app/feature/main_screen/presentation/bloc/random_anime_cubit/random_anime_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RandomAnimeCubit(getRandomAnimeUseCase: sl()));

  sl.registerLazySingleton(() => GetRandomAnimeUseCase(sl()));

  sl.registerLazySingleton<AnimeRepository>(
    () => AnimeRepositoryImpl(
      remoteDataSource: sl(),
      mapper: sl(),
    ),
  );

  sl.registerLazySingleton<AnimeRemoteDataSource>(
    () => AnimeRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton(() => Mapper());

  sl.registerLazySingleton(() => Dio());
}
