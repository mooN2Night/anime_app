import 'package:anime_app/core/constants/string_constant.dart';
import 'package:anime_app/core/error/exception.dart';
import 'package:anime_app/feature/main_screen/data/models/anime_model.dart';
import 'package:anime_app/feature/main_screen/data/models/last_changes_model.dart';
import 'package:anime_app/feature/main_screen/domain/entities/last_changes_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AnimeRemoteDataSource {
  Future<AnimeModel> getRandomAnime();

  Future<LastChangesAnimeModel> getLastChanges(int page);
}

class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  AnimeRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<AnimeModel> getRandomAnime() async {
    try {
      final response = await dio.get(
        '${StringConstants.baseUrl}title/random',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final anime = response.data;
        return AnimeModel.fromJson(anime);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<LastChangesAnimeModel> getLastChanges(int page) async {
    try {
      final response = await dio.get(
        '${StringConstants.baseUrl}title/changes?limit=15&page=$page',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final anime = response.data;
        return LastChangesAnimeModel.fromJson(anime);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}
