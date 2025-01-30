// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_changes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastChangesAnimeModel _$LastChangesAnimeModelFromJson(
        Map<String, dynamic> json) =>
    LastChangesAnimeModel(
      animeList: (json['list'] as List<dynamic>)
          .map((e) => AnimeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LastChangesAnimeModelToJson(
        LastChangesAnimeModel instance) =>
    <String, dynamic>{
      'list': instance.animeList,
      'pagination': instance.pagination,
    };

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      pages: (json['pages'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      itemsPerPage: (json['items_per_page'] as num).toInt(),
      totalItems: (json['total_items'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'pages': instance.pages,
      'current_page': instance.currentPage,
      'items_per_page': instance.itemsPerPage,
      'total_items': instance.totalItems,
    };
