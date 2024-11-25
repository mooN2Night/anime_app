import 'package:anime_app/feature/main_screen/data/models/anime_model.dart';
import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final int id;
  final String code;
  final AnimeNameEntity names;
  final List<FranchisesEntity?>? franchises;
  final String? announce;
  final StatusEntity status;
  final PostersEntity posters;
  final AnimeTypeEntity type;
  final List<String> genres;
  final AnimeTeamEntity team;
  final AnimeSeasonEntity season;
  final String description;
  final int inFavorite;
  final AnimePlayerEntity player;

  const AnimeEntity({
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

  @override
  List<Object?> get props => [
        id,
        code,
        names,
        franchises,
        announce,
        status,
        posters,
        type,
        genres,
        team,
        season,
        description,
        inFavorite,
      ];
}

class AnimeNameEntity extends Equatable {
  final String ru;
  final String en;
  final String? alternative;

  const AnimeNameEntity({
    required this.ru,
    required this.en,
    required this.alternative,
  });

  @override
  List<Object?> get props => [ru, en, alternative];
}

class FranchisesEntity extends Equatable {
  final FranchiseEntity franchise;
  final List<ReleasesEntity> releases;

  const FranchisesEntity({required this.franchise, required this.releases});

  @override
  List<Object?> get props => [franchise, releases];
}

class FranchiseEntity extends Equatable {
  final String id;
  final String name;

  const FranchiseEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class ReleasesEntity extends Equatable {
  final int id;
  final String code;
  final int ordinal;
  final AnimeNameEntity names;

  const ReleasesEntity({
    required this.id,
    required this.code,
    required this.ordinal,
    required this.names,
  });

  @override
  List<Object?> get props => [id, code, ordinal, names];
}

class StatusEntity extends Equatable {
  final String string;
  final int code;

  const StatusEntity({required this.string, required this.code});

  @override
  List<Object?> get props => [string, code];
}

class PostersEntity extends Equatable {
  final PostersSizeEntity postersSmall;
  final PostersSizeEntity postersMedium;
  final PostersSizeEntity postersOriginal;

  const PostersEntity({
    required this.postersSmall,
    required this.postersMedium,
    required this.postersOriginal,
  });

  @override
  List<Object?> get props => [postersSmall, postersMedium, postersOriginal];
}

class PostersSizeEntity extends Equatable {
  final String url;

  const PostersSizeEntity({required this.url});

  @override
  List<Object?> get props => [url];
}

class AnimeTypeEntity extends Equatable {
  final String fullString;
  final int code;
  final String string;
  final int? episodes;
  final int? length;

  const AnimeTypeEntity({
    required this.fullString,
    required this.code,
    required this.string,
    required this.episodes,
    required this.length,
  });

  @override
  List<Object?> get props => [fullString, code, string, episodes, length];
}

class AnimeTeamEntity extends Equatable {
  final List<String> voice;

  const AnimeTeamEntity({required this.voice});

  @override
  List<Object?> get props => [voice];
}

class AnimeSeasonEntity extends Equatable {
  final String? string;
  final int code;
  final int year;
  final int weekDay;

  const AnimeSeasonEntity({
    required this.string,
    required this.code,
    required this.year,
    required this.weekDay,
  });

  @override
  List<Object?> get props => [string, code, year, weekDay];
}

class AnimePlayerEntity extends Equatable {
  final String? alternativePlayer;
  final String? host;
  final bool isRutube;
  final AnimeReleasedEpisodeEntity releasedEpisodeEntity;
  final Map<String, AnimeEpisodeEntity> episodeEntity;

  const AnimePlayerEntity({
    required this.alternativePlayer,
    required this.host,
    required this.isRutube,
    required this.releasedEpisodeEntity,
    required this.episodeEntity,
  });

  @override
  List<Object?> get props => [
        alternativePlayer,
        host,
        isRutube,
        releasedEpisodeEntity,
        episodeEntity,
      ];
}

class AnimeReleasedEpisodeEntity extends Equatable {
  final int? firstEpisode;
  final int? lastEpisode;
  final String? releasedEpisodes;

  const AnimeReleasedEpisodeEntity({
    required this.firstEpisode,
    required this.lastEpisode,
    required this.releasedEpisodes,
  });

  @override
  List<Object?> get props => [firstEpisode, lastEpisode, releasedEpisodes];
}

class AnimeEpisodeEntity extends Equatable {
  final int? episodeNumber;
  final String? episodeName;
  final String? episodeImage;

  const AnimeEpisodeEntity({
    required this.episodeNumber,
    required this.episodeName,
    required this.episodeImage,
  });

  factory AnimeEpisodeEntity.fromModel(AnimeEpisodeModel model) {
    return AnimeEpisodeEntity(
      episodeNumber: model.episodeNumber,
      episodeName: model.episodeName,
      episodeImage: model.episodeImage,
    );
  }

  @override
  List<Object?> get props => [episodeNumber, episodeName, episodeImage];
}
