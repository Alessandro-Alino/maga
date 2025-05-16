// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';

part 'image_model.g.dart';

@freezed
sealed class ImageModel with _$ImageModel {
  const factory ImageModel({
    @JsonKey(includeIfNull: false) int? id,
    String? slug,
    @JsonKey(name: "alt_text") required String alText,
    @JsonKey(name: "media_type") required String mediaType,
    @JsonKey(name: "mime_type") required String mimeType,
    required Guid guid,
    required Title title,
    //required Sizes sizes,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

@freezed
sealed class Title with _$Title {
  const factory Title({required String rendered}) = _Title;

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}

@freezed
sealed class Guid with _$Guid {
  const factory Guid({required String rendered}) = _Guid;

  factory Guid.fromJson(Map<String, dynamic> json) => _$GuidFromJson(json);
}

// @freezed
// sealed class Sizes with _$Sizes {
//   const factory Sizes({
//     required Full full,
//     @Default({}) Map<String, ImageInfo>? others,
//   }) = _Sizes;
//
//   factory Sizes.fromJson(Map<String, dynamic> json) => _$SizesFromJson(json);
// }
//
// @freezed
// sealed class Full with _$Full {
//   const factory Full({
//     required String file,
//     required int width,
//     required int height,
//     int? filesize,
//     @JsonKey(name: "mime_type") required String mimeType,
//     @JsonKey(name: "source_url") required String sourceUrl,
//   }) = _Full;
//
//   factory Full.fromJson(Map<String, dynamic> json) => _$FullFromJson(json);
// }
//
// @freezed
// sealed class ImageInfo with _$ImageInfo {
//   const factory ImageInfo({
//     required String file,
//     required int width,
//     required int height,
//     int? filesize,
//     @JsonKey(name: "mime_type") required String mimeType,
//     @JsonKey(name: "source_url") required String sourceUrl,
//   }) = _ImageInfo;
//
//   factory ImageInfo.fromJson(Map<String, dynamic> json) =>
//       _$ImageInfoFromJson(json);
// }

