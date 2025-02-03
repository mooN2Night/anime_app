import 'package:anime_app/feature/main_screen/data/models/anime_model.dart';
import 'package:anime_app/feature/main_screen/data/models/last_changes_model.dart';
import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:anime_app/feature/main_screen/domain/entities/last_changes_entity.dart';

class Mapper {
  AnimeEntity animeToEntity(AnimeModel animeModel) {
    return AnimeEntity(
      id: animeModel.id,
      code: animeModel.code,
      names: animeNameToEntity(animeModel.names),
      franchises: animeModel.franchises
          ?.map((franchiseModel) => franchisesToEntity(franchiseModel))
          .toList(),
      announce: animeModel.announce,
      status: statusToEntity(animeModel.status),
      posters: postersToEntity(animeModel.posters),
      type: animeTypeToEntity(animeModel.type),
      genres: animeModel.genres,
      team: animeTeamToEntity(animeModel.team),
      season: animeSeasonToEntity(animeModel.season),
      description: animeModel.description,
      inFavorite: animeModel.inFavorite,
      player: animePlayerToEntity(animeModel.player),
    );
  }

  AnimeNameEntity animeNameToEntity(AnimeNameModel animeNameModel) {
    return AnimeNameEntity(
      ru: animeNameModel.ru,
      en: animeNameModel.en,
      alternative: animeNameModel.alternative,
    );
  }

  FranchisesEntity? franchisesToEntity(FranchisesModel? franchisesModel) {
    if (franchisesModel == null) return null;

    return FranchisesEntity(
      franchise: franchiseToEntity(franchisesModel.franchise),
      releases: releasesToEntity(franchisesModel.releases),
    );
  }

  FranchiseEntity franchiseToEntity(FranchiseModel franchiseModel) {
    return FranchiseEntity(
      id: franchiseModel.id,
      name: franchiseModel.name,
    );
  }

  List<ReleasesEntity> releasesToEntity(List<ReleasesModel> releasesModels) {
    return releasesModels
        .map(
          (releasesModel) => ReleasesEntity(
            id: releasesModel.id,
            code: releasesModel.code,
            ordinal: releasesModel.ordinal,
            names: animeNameToEntity(releasesModel.names),
          ),
        )
        .toList();
  }

  StatusEntity statusToEntity(StatusModel statusModel) {
    return StatusEntity(
      string: statusModel.string,
      code: statusModel.code,
    );
  }

  PostersEntity postersToEntity(PostersModel postersModel) {
    return PostersEntity(
      postersSmall: postersSizeToEntity(postersModel.postersSmall),
      postersMedium: postersSizeToEntity(postersModel.postersMedium),
      postersOriginal: postersSizeToEntity(postersModel.postersOriginal),
    );
  }

  PostersSizeEntity postersSizeToEntity(PostersSizeModel postersSizeModel) {
    return PostersSizeEntity(url: postersSizeModel.url);
  }

  AnimeTypeEntity animeTypeToEntity(AnimeTypeModel animeTypeModel) {
    return AnimeTypeEntity(
      fullString: animeTypeModel.fullString,
      code: animeTypeModel.code,
      string: animeTypeModel.string,
      episodes: animeTypeModel.episodes,
      length: animeTypeModel.length,
    );
  }

  AnimeTeamEntity animeTeamToEntity(AnimeTeamModel animeTeamModel) {
    return AnimeTeamEntity(voice: animeTeamModel.voice);
  }

  AnimeSeasonEntity animeSeasonToEntity(AnimeSeasonModel animeSeasonModel) {
    return AnimeSeasonEntity(
      string: animeSeasonModel.string,
      code: animeSeasonModel.code,
      year: animeSeasonModel.year,
      weekDay: animeSeasonModel.weekDay,
    );
  }

  AnimePlayerEntity animePlayerToEntity(AnimePlayerModel? animePlayerModel) {
    return AnimePlayerEntity(
      alternativePlayer: animePlayerModel?.alternativePlayer,
      host: animePlayerModel?.host,
      isRutube: animePlayerModel?.isRutube,
      releasedEpisodeEntity:
          animeReleasedEpisodeToEntity(animePlayerModel?.releasedEpisodeModel),
      episodeEntity: animeEpisodeToEntity(animePlayerModel?.episodeModel),
    );
  }

  AnimeReleasedEpisodeEntity animeReleasedEpisodeToEntity(
    AnimeReleasedEpisodeModel? animeReleasedEpisodeModel,
  ) {
    return AnimeReleasedEpisodeEntity(
      firstEpisode: animeReleasedEpisodeModel?.firstEpisode,
      lastEpisode: animeReleasedEpisodeModel?.lastEpisode,
      releasedEpisodes: animeReleasedEpisodeModel?.releasedEpisodes,
    );
  }

  Map<String, AnimeEpisodeEntity>? animeEpisodeToEntity(
    Map<String, AnimeEpisodeModel>? animeEpisodeModel,
  ) {
    return animeEpisodeModel?.map(
      (key, value) => MapEntry(
        key,
        animeEpisodeModelToEntity(value),
      ),
    );
  }

  AnimeEpisodeEntity animeEpisodeModelToEntity(
    AnimeEpisodeModel animeEpisodeModel,
  ) {
    return AnimeEpisodeEntity(
      episodeNumber: animeEpisodeModel.episodeNumber,
      episodeName: animeEpisodeModel.episodeName,
      episodeImage: animeEpisodeModel.episodeImage,
      createdTimestamp: animeEpisodeModel.createdTimestamp
    );
  }

  LastChangesAnimeEntity lastChangesAnimeModelToEntity(
    LastChangesAnimeModel lastChangesAnimeModel,
  ) {
    return LastChangesAnimeEntity(
      animeList: lastChangesAnimeModel.animeList
          .map((anime) => animeToEntity(anime))
          .toList(),
      pagination: paginationModelToEntity(lastChangesAnimeModel.pagination),
    );
  }

  PaginationEntity paginationModelToEntity(PaginationModel paginationModel) {
    return PaginationEntity(
      pages: paginationModel.pages,
      currentPage: paginationModel.currentPage,
      itemsPerPage: paginationModel.itemsPerPage,
      totalItems: paginationModel.totalItems,
    );
  }
}
