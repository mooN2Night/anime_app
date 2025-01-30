import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';
import 'package:equatable/equatable.dart';

class LastChangesAnimeEntity extends Equatable {
  final List<AnimeEntity> animeList;
  final PaginationEntity pagination;

  const LastChangesAnimeEntity({
    required this.animeList,
    required this.pagination,
  });

  @override
  List<Object?> get props => [animeList, pagination];
}

class PaginationEntity extends Equatable {
  final int pages;
  final int currentPage;
  final int itemsPerPage;
  final int totalItems;

  const PaginationEntity({
    required this.pages,
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalItems,
  });

  @override
  List<Object?> get props => [pages, currentPage, itemsPerPage, totalItems];
}
