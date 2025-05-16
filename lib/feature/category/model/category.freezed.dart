// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategModel {

@JsonKey(includeIfNull: false) int? get id; String get name; int get parent; ImageModelz? get image; String? get description; String? get alt; int? get count;
/// Create a copy of CategModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategModelCopyWith<CategModel> get copyWith => _$CategModelCopyWithImpl<CategModel>(this as CategModel, _$identity);

  /// Serializes this CategModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,parent,image,description,alt,count);

@override
String toString() {
  return 'CategModel(id: $id, name: $name, parent: $parent, image: $image, description: $description, alt: $alt, count: $count)';
}


}

/// @nodoc
abstract mixin class $CategModelCopyWith<$Res>  {
  factory $CategModelCopyWith(CategModel value, $Res Function(CategModel) _then) = _$CategModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String name, int parent, ImageModelz? image, String? description, String? alt, int? count
});


$ImageModelzCopyWith<$Res>? get image;

}
/// @nodoc
class _$CategModelCopyWithImpl<$Res>
    implements $CategModelCopyWith<$Res> {
  _$CategModelCopyWithImpl(this._self, this._then);

  final CategModel _self;
  final $Res Function(CategModel) _then;

/// Create a copy of CategModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? parent = null,Object? image = freezed,Object? description = freezed,Object? alt = freezed,Object? count = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as int,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageModelz?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CategModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelzCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageModelzCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _CategModel implements CategModel {
  const _CategModel({@JsonKey(includeIfNull: false) this.id, required this.name, required this.parent, this.image, this.description, this.alt, this.count = 0});
  factory _CategModel.fromJson(Map<String, dynamic> json) => _$CategModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override final  String name;
@override final  int parent;
@override final  ImageModelz? image;
@override final  String? description;
@override final  String? alt;
@override@JsonKey() final  int? count;

/// Create a copy of CategModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategModelCopyWith<_CategModel> get copyWith => __$CategModelCopyWithImpl<_CategModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,parent,image,description,alt,count);

@override
String toString() {
  return 'CategModel(id: $id, name: $name, parent: $parent, image: $image, description: $description, alt: $alt, count: $count)';
}


}

/// @nodoc
abstract mixin class _$CategModelCopyWith<$Res> implements $CategModelCopyWith<$Res> {
  factory _$CategModelCopyWith(_CategModel value, $Res Function(_CategModel) _then) = __$CategModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String name, int parent, ImageModelz? image, String? description, String? alt, int? count
});


@override $ImageModelzCopyWith<$Res>? get image;

}
/// @nodoc
class __$CategModelCopyWithImpl<$Res>
    implements _$CategModelCopyWith<$Res> {
  __$CategModelCopyWithImpl(this._self, this._then);

  final _CategModel _self;
  final $Res Function(_CategModel) _then;

/// Create a copy of CategModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? parent = null,Object? image = freezed,Object? description = freezed,Object? alt = freezed,Object? count = freezed,}) {
  return _then(_CategModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as int,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageModelz?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CategModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelzCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageModelzCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// @nodoc
mixin _$ImageModelz {

@JsonKey(includeIfNull: false) int? get id; String get src;
/// Create a copy of ImageModelz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageModelzCopyWith<ImageModelz> get copyWith => _$ImageModelzCopyWithImpl<ImageModelz>(this as ImageModelz, _$identity);

  /// Serializes this ImageModelz to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageModelz&&(identical(other.id, id) || other.id == id)&&(identical(other.src, src) || other.src == src));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,src);

@override
String toString() {
  return 'ImageModelz(id: $id, src: $src)';
}


}

/// @nodoc
abstract mixin class $ImageModelzCopyWith<$Res>  {
  factory $ImageModelzCopyWith(ImageModelz value, $Res Function(ImageModelz) _then) = _$ImageModelzCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String src
});




}
/// @nodoc
class _$ImageModelzCopyWithImpl<$Res>
    implements $ImageModelzCopyWith<$Res> {
  _$ImageModelzCopyWithImpl(this._self, this._then);

  final ImageModelz _self;
  final $Res Function(ImageModelz) _then;

/// Create a copy of ImageModelz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? src = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ImageModelz implements ImageModelz {
  const _ImageModelz({@JsonKey(includeIfNull: false) this.id, required this.src});
  factory _ImageModelz.fromJson(Map<String, dynamic> json) => _$ImageModelzFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override final  String src;

/// Create a copy of ImageModelz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageModelzCopyWith<_ImageModelz> get copyWith => __$ImageModelzCopyWithImpl<_ImageModelz>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageModelzToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageModelz&&(identical(other.id, id) || other.id == id)&&(identical(other.src, src) || other.src == src));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,src);

@override
String toString() {
  return 'ImageModelz(id: $id, src: $src)';
}


}

/// @nodoc
abstract mixin class _$ImageModelzCopyWith<$Res> implements $ImageModelzCopyWith<$Res> {
  factory _$ImageModelzCopyWith(_ImageModelz value, $Res Function(_ImageModelz) _then) = __$ImageModelzCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String src
});




}
/// @nodoc
class __$ImageModelzCopyWithImpl<$Res>
    implements _$ImageModelzCopyWith<$Res> {
  __$ImageModelzCopyWithImpl(this._self, this._then);

  final _ImageModelz _self;
  final $Res Function(_ImageModelz) _then;

/// Create a copy of ImageModelz
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? src = null,}) {
  return _then(_ImageModelz(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
