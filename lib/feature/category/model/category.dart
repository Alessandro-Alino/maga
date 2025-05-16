// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

part 'category.g.dart';

@freezed
sealed class CategModel with _$CategModel {
  const factory CategModel({
    @JsonKey(includeIfNull: false) int? id,
    required String name,
    required int parent,
    ImageModelz? image,
    String? description,
    String? alt,
    @Default(0) int? count,
  }) = _CategModel;

  factory CategModel.fromJson(Map<String, dynamic> json) =>
      _$CategModelFromJson(json);
}

@freezed
sealed class ImageModelz with _$ImageModelz {
  const factory ImageModelz({
    @JsonKey(includeIfNull: false) int? id,
    required String src,
  }) = _ImageModelz;

  factory ImageModelz.fromJson(Map<String, dynamic> json) =>
      _$ImageModelzFromJson(json);
}
