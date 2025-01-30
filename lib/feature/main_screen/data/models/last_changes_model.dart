import 'package:json_annotation/json_annotation.dart';
import 'anime_model.dart';

part 'last_changes_model.g.dart';

@JsonSerializable()
class LastChangesAnimeModel {
  @JsonKey(name: 'list')
  final List<AnimeModel> animeList;
  final PaginationModel pagination;

  LastChangesAnimeModel({
    required this.animeList,
    required this.pagination,
  });

  factory LastChangesAnimeModel.fromJson(Map<String, dynamic> json) =>
      _$LastChangesAnimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$LastChangesAnimeModelToJson(this);
}

@JsonSerializable()
class PaginationModel {
  final int pages;
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'items_per_page')
  final int itemsPerPage;
  @JsonKey(name: 'total_items')
  final int totalItems;

  PaginationModel({
    required this.pages,
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalItems,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}
