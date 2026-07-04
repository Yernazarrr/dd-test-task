// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) =>
    _PaginationDto(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
      hasPrev: json['hasPrev'] as bool,
    );

Map<String, dynamic> _$PaginationDtoToJson(_PaginationDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'pages': instance.pages,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };
