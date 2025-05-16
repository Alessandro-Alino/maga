// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageModel {

@JsonKey(includeIfNull: false) int? get id; String? get slug;@JsonKey(name: "alt_text") String get alText;@JsonKey(name: "media_type") String get mediaType;@JsonKey(name: "mime_type") String get mimeType; Guid get guid; Title get title;
/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageModelCopyWith<ImageModel> get copyWith => _$ImageModelCopyWithImpl<ImageModel>(this as ImageModel, _$identity);

  /// Serializes this ImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.alText, alText) || other.alText == alText)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,alText,mediaType,mimeType,guid,title);

@override
String toString() {
  return 'ImageModel(id: $id, slug: $slug, alText: $alText, mediaType: $mediaType, mimeType: $mimeType, guid: $guid, title: $title)';
}


}

/// @nodoc
abstract mixin class $ImageModelCopyWith<$Res>  {
  factory $ImageModelCopyWith(ImageModel value, $Res Function(ImageModel) _then) = _$ImageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String? slug,@JsonKey(name: "alt_text") String alText,@JsonKey(name: "media_type") String mediaType,@JsonKey(name: "mime_type") String mimeType, Guid guid, Title title
});


$GuidCopyWith<$Res> get guid;$TitleCopyWith<$Res> get title;

}
/// @nodoc
class _$ImageModelCopyWithImpl<$Res>
    implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._self, this._then);

  final ImageModel _self;
  final $Res Function(ImageModel) _then;

/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? slug = freezed,Object? alText = null,Object? mediaType = null,Object? mimeType = null,Object? guid = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,alText: null == alText ? _self.alText : alText // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,guid: null == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as Guid,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title,
  ));
}
/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuidCopyWith<$Res> get guid {
  
  return $GuidCopyWith<$Res>(_self.guid, (value) {
    return _then(_self.copyWith(guid: value));
  });
}/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res> get title {
  
  return $TitleCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ImageModel implements ImageModel {
  const _ImageModel({@JsonKey(includeIfNull: false) this.id, this.slug, @JsonKey(name: "alt_text") required this.alText, @JsonKey(name: "media_type") required this.mediaType, @JsonKey(name: "mime_type") required this.mimeType, required this.guid, required this.title});
  factory _ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override final  String? slug;
@override@JsonKey(name: "alt_text") final  String alText;
@override@JsonKey(name: "media_type") final  String mediaType;
@override@JsonKey(name: "mime_type") final  String mimeType;
@override final  Guid guid;
@override final  Title title;

/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageModelCopyWith<_ImageModel> get copyWith => __$ImageModelCopyWithImpl<_ImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.alText, alText) || other.alText == alText)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,alText,mediaType,mimeType,guid,title);

@override
String toString() {
  return 'ImageModel(id: $id, slug: $slug, alText: $alText, mediaType: $mediaType, mimeType: $mimeType, guid: $guid, title: $title)';
}


}

/// @nodoc
abstract mixin class _$ImageModelCopyWith<$Res> implements $ImageModelCopyWith<$Res> {
  factory _$ImageModelCopyWith(_ImageModel value, $Res Function(_ImageModel) _then) = __$ImageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String? slug,@JsonKey(name: "alt_text") String alText,@JsonKey(name: "media_type") String mediaType,@JsonKey(name: "mime_type") String mimeType, Guid guid, Title title
});


@override $GuidCopyWith<$Res> get guid;@override $TitleCopyWith<$Res> get title;

}
/// @nodoc
class __$ImageModelCopyWithImpl<$Res>
    implements _$ImageModelCopyWith<$Res> {
  __$ImageModelCopyWithImpl(this._self, this._then);

  final _ImageModel _self;
  final $Res Function(_ImageModel) _then;

/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? slug = freezed,Object? alText = null,Object? mediaType = null,Object? mimeType = null,Object? guid = null,Object? title = null,}) {
  return _then(_ImageModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,alText: null == alText ? _self.alText : alText // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,guid: null == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as Guid,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title,
  ));
}

/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuidCopyWith<$Res> get guid {
  
  return $GuidCopyWith<$Res>(_self.guid, (value) {
    return _then(_self.copyWith(guid: value));
  });
}/// Create a copy of ImageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res> get title {
  
  return $TitleCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}


/// @nodoc
mixin _$Title {

 String get rendered;
/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitleCopyWith<Title> get copyWith => _$TitleCopyWithImpl<Title>(this as Title, _$identity);

  /// Serializes this Title to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Title&&(identical(other.rendered, rendered) || other.rendered == rendered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rendered);

@override
String toString() {
  return 'Title(rendered: $rendered)';
}


}

/// @nodoc
abstract mixin class $TitleCopyWith<$Res>  {
  factory $TitleCopyWith(Title value, $Res Function(Title) _then) = _$TitleCopyWithImpl;
@useResult
$Res call({
 String rendered
});




}
/// @nodoc
class _$TitleCopyWithImpl<$Res>
    implements $TitleCopyWith<$Res> {
  _$TitleCopyWithImpl(this._self, this._then);

  final Title _self;
  final $Res Function(Title) _then;

/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rendered = null,}) {
  return _then(_self.copyWith(
rendered: null == rendered ? _self.rendered : rendered // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Title implements Title {
  const _Title({required this.rendered});
  factory _Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

@override final  String rendered;

/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleCopyWith<_Title> get copyWith => __$TitleCopyWithImpl<_Title>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TitleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Title&&(identical(other.rendered, rendered) || other.rendered == rendered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rendered);

@override
String toString() {
  return 'Title(rendered: $rendered)';
}


}

/// @nodoc
abstract mixin class _$TitleCopyWith<$Res> implements $TitleCopyWith<$Res> {
  factory _$TitleCopyWith(_Title value, $Res Function(_Title) _then) = __$TitleCopyWithImpl;
@override @useResult
$Res call({
 String rendered
});




}
/// @nodoc
class __$TitleCopyWithImpl<$Res>
    implements _$TitleCopyWith<$Res> {
  __$TitleCopyWithImpl(this._self, this._then);

  final _Title _self;
  final $Res Function(_Title) _then;

/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rendered = null,}) {
  return _then(_Title(
rendered: null == rendered ? _self.rendered : rendered // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Guid {

 String get rendered;
/// Create a copy of Guid
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuidCopyWith<Guid> get copyWith => _$GuidCopyWithImpl<Guid>(this as Guid, _$identity);

  /// Serializes this Guid to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Guid&&(identical(other.rendered, rendered) || other.rendered == rendered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rendered);

@override
String toString() {
  return 'Guid(rendered: $rendered)';
}


}

/// @nodoc
abstract mixin class $GuidCopyWith<$Res>  {
  factory $GuidCopyWith(Guid value, $Res Function(Guid) _then) = _$GuidCopyWithImpl;
@useResult
$Res call({
 String rendered
});




}
/// @nodoc
class _$GuidCopyWithImpl<$Res>
    implements $GuidCopyWith<$Res> {
  _$GuidCopyWithImpl(this._self, this._then);

  final Guid _self;
  final $Res Function(Guid) _then;

/// Create a copy of Guid
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rendered = null,}) {
  return _then(_self.copyWith(
rendered: null == rendered ? _self.rendered : rendered // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Guid implements Guid {
  const _Guid({required this.rendered});
  factory _Guid.fromJson(Map<String, dynamic> json) => _$GuidFromJson(json);

@override final  String rendered;

/// Create a copy of Guid
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuidCopyWith<_Guid> get copyWith => __$GuidCopyWithImpl<_Guid>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuidToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Guid&&(identical(other.rendered, rendered) || other.rendered == rendered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rendered);

@override
String toString() {
  return 'Guid(rendered: $rendered)';
}


}

/// @nodoc
abstract mixin class _$GuidCopyWith<$Res> implements $GuidCopyWith<$Res> {
  factory _$GuidCopyWith(_Guid value, $Res Function(_Guid) _then) = __$GuidCopyWithImpl;
@override @useResult
$Res call({
 String rendered
});




}
/// @nodoc
class __$GuidCopyWithImpl<$Res>
    implements _$GuidCopyWith<$Res> {
  __$GuidCopyWithImpl(this._self, this._then);

  final _Guid _self;
  final $Res Function(_Guid) _then;

/// Create a copy of Guid
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rendered = null,}) {
  return _then(_Guid(
rendered: null == rendered ? _self.rendered : rendered // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
