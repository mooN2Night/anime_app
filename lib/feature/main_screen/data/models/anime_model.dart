import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel {
  final int id;
  final String code;
  final AnimeNameModel names;
  final List<FranchisesModel?>? franchises;
  final String? announce;
  final StatusModel status;
  final PostersModel posters;
  final AnimeTypeModel type;
  final List<String> genres;
  final AnimeTeamModel team;
  final AnimeSeasonModel season;
  final String? description;
  @JsonKey(name: 'in_favorites')
  final int inFavorite;
  final AnimePlayerModel player;

  AnimeModel({
    required this.id,
    required this.code,
    required this.names,
    required this.franchises,
    required this.announce,
    required this.status,
    required this.posters,
    required this.type,
    required this.genres,
    required this.team,
    required this.season,
    required this.description,
    required this.inFavorite,
    required this.player,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}

@JsonSerializable()
class AnimeNameModel {
  final String ru;
  final String en;
  final String? alternative;

  const AnimeNameModel({
    required this.ru,
    required this.en,
    required this.alternative,
  });

  factory AnimeNameModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeNameModelToJson(this);
}

@JsonSerializable()
class FranchisesModel {
  final FranchiseModel franchise;
  final List<ReleasesModel> releases;

  const FranchisesModel({required this.franchise, required this.releases});

  factory FranchisesModel.fromJson(Map<String, dynamic> json) =>
      _$FranchisesModelFromJson(json);

  Map<String, dynamic> toJson() => _$FranchisesModelToJson(this);
}

@JsonSerializable()
class FranchiseModel {
  final String id;
  final String name;

  const FranchiseModel({required this.id, required this.name});

  factory FranchiseModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseModelToJson(this);
}

@JsonSerializable()
class ReleasesModel {
  final int id;
  final String code;
  final int ordinal;
  final AnimeNameModel names;

  const ReleasesModel({
    required this.id,
    required this.code,
    required this.ordinal,
    required this.names,
  });

  factory ReleasesModel.fromJson(Map<String, dynamic> json) =>
      _$ReleasesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReleasesModelToJson(this);
}

@JsonSerializable()
class StatusModel {
  final String string;
  final int code;

  const StatusModel({required this.string, required this.code});

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}

@JsonSerializable()
class PostersModel {
  @JsonKey(name: 'small')
  final PostersSizeModel postersSmall;
  @JsonKey(name: 'medium')
  final PostersSizeModel postersMedium;
  @JsonKey(name: 'original')
  final PostersSizeModel postersOriginal;

  const PostersModel({
    required this.postersSmall,
    required this.postersMedium,
    required this.postersOriginal,
  });

  factory PostersModel.fromJson(Map<String, dynamic> json) =>
      _$PostersModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostersModelToJson(this);
}

@JsonSerializable()
class PostersSizeModel {
  final String url;

  const PostersSizeModel({required this.url});

  factory PostersSizeModel.fromJson(Map<String, dynamic> json) =>
      _$PostersSizeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostersSizeModelToJson(this);
}

@JsonSerializable()
class AnimeTypeModel {
  @JsonKey(name: 'full_string')
  final String fullString;
  final int code;
  final String string;
  final int? episodes;
  final int? length;

  const AnimeTypeModel({
    required this.fullString,
    required this.code,
    required this.string,
    required this.episodes,
    required this.length,
  });

  factory AnimeTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeTypeModelToJson(this);
}

@JsonSerializable()
class AnimeTeamModel {
  final List<String> voice;

  const AnimeTeamModel({required this.voice});

  factory AnimeTeamModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeTeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeTeamModelToJson(this);
}

@JsonSerializable()
class AnimeSeasonModel {
  final String? string;
  final int code;
  final int year;
  @JsonKey(name: 'week_day')
  final int weekDay;

  const AnimeSeasonModel({
    required this.string,
    required this.code,
    required this.year,
    required this.weekDay,
  });

  factory AnimeSeasonModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeSeasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeSeasonModelToJson(this);
}

@JsonSerializable()
class AnimePlayerModel {
  @JsonKey(name: 'alternative_player')
  final String? alternativePlayer;
  final String? host;
  @JsonKey(name: 'is_rutube')
  final bool isRutube;
  @JsonKey(name: 'episodes')
  final AnimeReleasedEpisodeModel releasedEpisodeModel;
  @JsonKey(name: 'list')
  final Map<String, AnimeEpisodeModel> episodeModel;

  const AnimePlayerModel({
    required this.alternativePlayer,
    required this.host,
    required this.isRutube,
    required this.releasedEpisodeModel,
    required this.episodeModel,
  });

  factory AnimePlayerModel.fromJson(Map<String, dynamic> json) =>
      _$AnimePlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimePlayerModelToJson(this);
}

@JsonSerializable()
class AnimeReleasedEpisodeModel {
  @JsonKey(name: 'first')
  final int? firstEpisode;
  @JsonKey(name: 'last')
  final int? lastEpisode;
  @JsonKey(name: 'string')
  final String? releasedEpisodes;

  const AnimeReleasedEpisodeModel({
    required this.firstEpisode,
    required this.lastEpisode,
    required this.releasedEpisodes,
  });

  factory AnimeReleasedEpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeReleasedEpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeReleasedEpisodeModelToJson(this);
}

@JsonSerializable()
class AnimeEpisodeModel {
  @JsonKey(name: 'episode')
  final int? episodeNumber;
  @JsonKey(name: 'name')
  final String? episodeName;
  @JsonKey(name: 'preview')
  final String? episodeImage;

  const AnimeEpisodeModel({
    required this.episodeNumber,
    required this.episodeName,
    required this.episodeImage,
  });

  factory AnimeEpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeEpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeEpisodeModelToJson(this);
}