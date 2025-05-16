// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => _ImageModel(
  id: (json['id'] as num?)?.toInt(),
  slug: json['slug'] as String?,
  alText: json['alt_text'] as String,
  mediaType: json['media_type'] as String,
  mimeType: json['mime_type'] as String,
  guid: Guid.fromJson(json['guid'] as Map<String, dynamic>),
  title: Title.fromJson(json['title'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ImageModelToJson(_ImageModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'slug': instance.slug,
      'alt_text': instance.alText,
      'media_type': instance.mediaType,
      'mime_type': instance.mimeType,
      'guid': instance.guid,
      'title': instance.title,
    };

_Title _$TitleFromJson(Map<String, dynamic> json) =>
    _Title(rendered: json['rendered'] as String);

Map<String, dynamic> _$TitleToJson(_Title instance) => <String, dynamic>{
  'rendered': instance.rendered,
};

_Guid _$GuidFromJson(Map<String, dynamic> json) =>
    _Guid(rendered: json['rendered'] as String);

Map<String, dynamic> _$GuidToJson(_Guid instance) => <String, dynamic>{
  'rendered': instance.rendered,
};
