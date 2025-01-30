// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      names: AnimeNameModel.fromJson(json['names'] as Map<String, dynamic>),
      franchises: (json['franchises'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : FranchisesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      announce: json['announce'] as String?,
      status: StatusModel.fromJson(json['status'] as Map<String, dynamic>),
      posters: PostersModel.fromJson(json['posters'] as Map<String, dynamic>),
      type: AnimeTypeModel.fromJson(json['type'] as Map<String, dynamic>),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      team: AnimeTeamModel.fromJson(json['team'] as Map<String, dynamic>),
      season: AnimeSeasonModel.fromJson(json['season'] as Map<String, dynamic>),
      description: json['description'] as String?,
      inFavorite: (json['in_favorites'] as num).toInt(),
      player: AnimePlayerModel.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'names': instance.names,
      'franchises': instance.franchises,
      'announce': instance.announce,
      'status': instance.status,
      'posters': instance.posters,
      'type': instance.type,
      'genres': instance.genres,
      'team': instance.team,
      'season': instance.season,
      'description': instance.description,
      'in_favorites': instance.inFavorite,
      'player': instance.player,
    };

AnimeNameModel _$AnimeNameModelFromJson(Map<String, dynamic> json) =>
    AnimeNameModel(
      ru: json['ru'] as String,
      en: json['en'] as String,
      alternative: json['alternative'] as String?,
    );

Map<String, dynamic> _$AnimeNameModelToJson(AnimeNameModel instance) =>
    <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'alternative': instance.alternative,
    };

FranchisesModel _$FranchisesModelFromJson(Map<String, dynamic> json) =>
    FranchisesModel(
      franchise:
          FranchiseModel.fromJson(json['franchise'] as Map<String, dynamic>),
      releases: (json['releases'] as List<dynamic>)
          .map((e) => ReleasesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FranchisesModelToJson(FranchisesModel instance) =>
    <String, dynamic>{
      'franchise': instance.franchise,
      'releases': instance.releases,
    };

FranchiseModel _$FranchiseModelFromJson(Map<String, dynamic> json) =>
    FranchiseModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FranchiseModelToJson(FranchiseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ReleasesModel _$ReleasesModelFromJson(Map<String, dynamic> json) =>
    ReleasesModel(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      ordinal: (json['ordinal'] as num).toInt(),
      names: AnimeNameModel.fromJson(json['names'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReleasesModelToJson(ReleasesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'ordinal': instance.ordinal,
      'names': instance.names,
    };

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
      string: json['string'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'string': instance.string,
      'code': instance.code,
    };

PostersModel _$PostersModelFromJson(Map<String, dynamic> json) => PostersModel(
      postersSmall:
          PostersSizeModel.fromJson(json['small'] as Map<String, dynamic>),
      postersMedium:
          PostersSizeModel.fromJson(json['medium'] as Map<String, dynamic>),
      postersOriginal:
          PostersSizeModel.fromJson(json['original'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostersModelToJson(PostersModel instance) =>
    <String, dynamic>{
      'small': instance.postersSmall,
      'medium': instance.postersMedium,
      'original': instance.postersOriginal,
    };

PostersSizeModel _$PostersSizeModelFromJson(Map<String, dynamic> json) =>
    PostersSizeModel(
      url: json['url'] as String,
    );

Map<String, dynamic> _$PostersSizeModelToJson(PostersSizeModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

AnimeTypeModel _$AnimeTypeModelFromJson(Map<String, dynamic> json) =>
    AnimeTypeModel(
      fullString: json['full_string'] as String,
      code: (json['code'] as num).toInt(),
      string: json['string'] as String,
      episodes: (json['episodes'] as num?)?.toInt(),
      length: (json['length'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AnimeTypeModelToJson(AnimeTypeModel instance) =>
    <String, dynamic>{
      'full_string': instance.fullString,
      'code': instance.code,
      'string': instance.string,
      'episodes': instance.episodes,
      'length': instance.length,
    };

AnimeTeamModel _$AnimeTeamModelFromJson(Map<String, dynamic> json) =>
    AnimeTeamModel(
      voice: (json['voice'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AnimeTeamModelToJson(AnimeTeamModel instance) =>
    <String, dynamic>{
      'voice': instance.voice,
    };

AnimeSeasonModel _$AnimeSeasonModelFromJson(Map<String, dynamic> json) =>
    AnimeSeasonModel(
      string: json['string'] as String?,
      code: (json['code'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      weekDay: (json['week_day'] as num).toInt(),
    );

Map<String, dynamic> _$AnimeSeasonModelToJson(AnimeSeasonModel instance) =>
    <String, dynamic>{
      'string': instance.string,
      'code': instance.code,
      'year': instance.year,
      'week_day': instance.weekDay,
    };

AnimePlayerModel _$AnimePlayerModelFromJson(Map<String, dynamic> json) =>
    AnimePlayerModel(
      alternativePlayer: json['alternative_player'] as String?,
      host: json['host'] as String?,
      isRutube: json['is_rutube'] as bool,
      releasedEpisodeModel: AnimeReleasedEpisodeModel.fromJson(
          json['episodes'] as Map<String, dynamic>),
      episodeModel: (json['list'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, AnimeEpisodeModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$AnimePlayerModelToJson(AnimePlayerModel instance) =>
    <String, dynamic>{
      'alternative_player': instance.alternativePlayer,
      'host': instance.host,
      'is_rutube': instance.isRutube,
      'episodes': instance.releasedEpisodeModel,
      'list': instance.episodeModel,
    };

AnimeReleasedEpisodeModel _$AnimeReleasedEpisodeModelFromJson(
        Map<String, dynamic> json) =>
    AnimeReleasedEpisodeModel(
      firstEpisode: (json['first'] as num?)?.toInt(),
      lastEpisode: (json['last'] as num?)?.toInt(),
      releasedEpisodes: json['string'] as String?,
    );

Map<String, dynamic> _$AnimeReleasedEpisodeModelToJson(
        AnimeReleasedEpisodeModel instance) =>
    <String, dynamic>{
      'first': instance.firstEpisode,
      'last': instance.lastEpisode,
      'string': instance.releasedEpisodes,
    };

AnimeEpisodeModel _$AnimeEpisodeModelFromJson(Map<String, dynamic> json) =>
    AnimeEpisodeModel(
      episodeNumber: (json['episode'] as num?)?.toInt(),
      episodeName: json['name'] as String?,
      episodeImage: json['preview'] as String?,
    );

Map<String, dynamic> _$AnimeEpisodeModelToJson(AnimeEpisodeModel instance) =>
    <String, dynamic>{
      'episode': instance.episodeNumber,
      'name': instance.episodeName,
      'preview': instance.episodeImage,
    };
