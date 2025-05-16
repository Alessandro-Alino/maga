// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategModel _$CategModelFromJson(Map<String, dynamic> json) => _CategModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  parent: (json['parent'] as num).toInt(),
  image:
      json['image'] == null
          ? null
          : ImageModelz.fromJson(json['image'] as Map<String, dynamic>),
  description: json['description'] as String?,
  alt: json['alt'] as String?,
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CategModelToJson(_CategModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'name': instance.name,
      'parent': instance.parent,
      'image': instance.image,
      'description': instance.description,
      'alt': instance.alt,
      'count': instance.count,
    };

_ImageModelz _$ImageModelzFromJson(Map<String, dynamic> json) =>
    _ImageModelz(id: (json['id'] as num?)?.toInt(), src: json['src'] as String);

Map<String, dynamic> _$ImageModelzToJson(_ImageModelz instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'src': instance.src,
    };
