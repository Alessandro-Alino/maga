// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageState {

 ImageStatus get status; ManageImageStatus get manageStatus; List<ImageModel> get fetchedImageList; List<ImageModel> get filterImageList; int get totalImage; int get pages; int get currentPage; ImageModel? get selectedImage; File? get choosedImage; String? get errorMessage;
/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageStateCopyWith<ImageState> get copyWith => _$ImageStateCopyWithImpl<ImageState>(this as ImageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageState&&(identical(other.status, status) || other.status == status)&&(identical(other.manageStatus, manageStatus) || other.manageStatus == manageStatus)&&const DeepCollectionEquality().equals(other.fetchedImageList, fetchedImageList)&&const DeepCollectionEquality().equals(other.filterImageList, filterImageList)&&(identical(other.totalImage, totalImage) || other.totalImage == totalImage)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.choosedImage, choosedImage) || other.choosedImage == choosedImage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,manageStatus,const DeepCollectionEquality().hash(fetchedImageList),const DeepCollectionEquality().hash(filterImageList),totalImage,pages,currentPage,selectedImage,choosedImage,errorMessage);

@override
String toString() {
  return 'ImageState(status: $status, manageStatus: $manageStatus, fetchedImageList: $fetchedImageList, filterImageList: $filterImageList, totalImage: $totalImage, pages: $pages, currentPage: $currentPage, selectedImage: $selectedImage, choosedImage: $choosedImage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ImageStateCopyWith<$Res>  {
  factory $ImageStateCopyWith(ImageState value, $Res Function(ImageState) _then) = _$ImageStateCopyWithImpl;
@useResult
$Res call({
 ImageStatus status, ManageImageStatus manageStatus, List<ImageModel> fetchedImageList, List<ImageModel> filterImageList, int totalImage, int pages, int currentPage, ImageModel? selectedImage, File? choosedImage, String? errorMessage
});


$ImageModelCopyWith<$Res>? get selectedImage;

}
/// @nodoc
class _$ImageStateCopyWithImpl<$Res>
    implements $ImageStateCopyWith<$Res> {
  _$ImageStateCopyWithImpl(this._self, this._then);

  final ImageState _self;
  final $Res Function(ImageState) _then;

/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? manageStatus = null,Object? fetchedImageList = null,Object? filterImageList = null,Object? totalImage = null,Object? pages = null,Object? currentPage = null,Object? selectedImage = freezed,Object? choosedImage = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ImageStatus,manageStatus: null == manageStatus ? _self.manageStatus : manageStatus // ignore: cast_nullable_to_non_nullable
as ManageImageStatus,fetchedImageList: null == fetchedImageList ? _self.fetchedImageList : fetchedImageList // ignore: cast_nullable_to_non_nullable
as List<ImageModel>,filterImageList: null == filterImageList ? _self.filterImageList : filterImageList // ignore: cast_nullable_to_non_nullable
as List<ImageModel>,totalImage: null == totalImage ? _self.totalImage : totalImage // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as ImageModel?,choosedImage: freezed == choosedImage ? _self.choosedImage : choosedImage // ignore: cast_nullable_to_non_nullable
as File?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelCopyWith<$Res>? get selectedImage {
    if (_self.selectedImage == null) {
    return null;
  }

  return $ImageModelCopyWith<$Res>(_self.selectedImage!, (value) {
    return _then(_self.copyWith(selectedImage: value));
  });
}
}


/// @nodoc


class _ImageState implements ImageState {
  const _ImageState({required this.status, required this.manageStatus, required final  List<ImageModel> fetchedImageList, required final  List<ImageModel> filterImageList, required this.totalImage, required this.pages, required this.currentPage, this.selectedImage, this.choosedImage, this.errorMessage}): _fetchedImageList = fetchedImageList,_filterImageList = filterImageList;
  

@override final  ImageStatus status;
@override final  ManageImageStatus manageStatus;
 final  List<ImageModel> _fetchedImageList;
@override List<ImageModel> get fetchedImageList {
  if (_fetchedImageList is EqualUnmodifiableListView) return _fetchedImageList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fetchedImageList);
}

 final  List<ImageModel> _filterImageList;
@override List<ImageModel> get filterImageList {
  if (_filterImageList is EqualUnmodifiableListView) return _filterImageList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filterImageList);
}

@override final  int totalImage;
@override final  int pages;
@override final  int currentPage;
@override final  ImageModel? selectedImage;
@override final  File? choosedImage;
@override final  String? errorMessage;

/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageStateCopyWith<_ImageState> get copyWith => __$ImageStateCopyWithImpl<_ImageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageState&&(identical(other.status, status) || other.status == status)&&(identical(other.manageStatus, manageStatus) || other.manageStatus == manageStatus)&&const DeepCollectionEquality().equals(other._fetchedImageList, _fetchedImageList)&&const DeepCollectionEquality().equals(other._filterImageList, _filterImageList)&&(identical(other.totalImage, totalImage) || other.totalImage == totalImage)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.choosedImage, choosedImage) || other.choosedImage == choosedImage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,manageStatus,const DeepCollectionEquality().hash(_fetchedImageList),const DeepCollectionEquality().hash(_filterImageList),totalImage,pages,currentPage,selectedImage,choosedImage,errorMessage);

@override
String toString() {
  return 'ImageState(status: $status, manageStatus: $manageStatus, fetchedImageList: $fetchedImageList, filterImageList: $filterImageList, totalImage: $totalImage, pages: $pages, currentPage: $currentPage, selectedImage: $selectedImage, choosedImage: $choosedImage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ImageStateCopyWith<$Res> implements $ImageStateCopyWith<$Res> {
  factory _$ImageStateCopyWith(_ImageState value, $Res Function(_ImageState) _then) = __$ImageStateCopyWithImpl;
@override @useResult
$Res call({
 ImageStatus status, ManageImageStatus manageStatus, List<ImageModel> fetchedImageList, List<ImageModel> filterImageList, int totalImage, int pages, int currentPage, ImageModel? selectedImage, File? choosedImage, String? errorMessage
});


@override $ImageModelCopyWith<$Res>? get selectedImage;

}
/// @nodoc
class __$ImageStateCopyWithImpl<$Res>
    implements _$ImageStateCopyWith<$Res> {
  __$ImageStateCopyWithImpl(this._self, this._then);

  final _ImageState _self;
  final $Res Function(_ImageState) _then;

/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? manageStatus = null,Object? fetchedImageList = null,Object? filterImageList = null,Object? totalImage = null,Object? pages = null,Object? currentPage = null,Object? selectedImage = freezed,Object? choosedImage = freezed,Object? errorMessage = freezed,}) {
  return _then(_ImageState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ImageStatus,manageStatus: null == manageStatus ? _self.manageStatus : manageStatus // ignore: cast_nullable_to_non_nullable
as ManageImageStatus,fetchedImageList: null == fetchedImageList ? _self._fetchedImageList : fetchedImageList // ignore: cast_nullable_to_non_nullable
as List<ImageModel>,filterImageList: null == filterImageList ? _self._filterImageList : filterImageList // ignore: cast_nullable_to_non_nullable
as List<ImageModel>,totalImage: null == totalImage ? _self.totalImage : totalImage // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as ImageModel?,choosedImage: freezed == choosedImage ? _self.choosedImage : choosedImage // ignore: cast_nullable_to_non_nullable
as File?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelCopyWith<$Res>? get selectedImage {
    if (_self.selectedImage == null) {
    return null;
  }

  return $ImageModelCopyWith<$Res>(_self.selectedImage!, (value) {
    return _then(_self.copyWith(selectedImage: value));
  });
}
}

/// @nodoc
mixin _$ImageEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageEvent()';
}


}

/// @nodoc
class $ImageEventCopyWith<$Res>  {
$ImageEventCopyWith(ImageEvent _, $Res Function(ImageEvent) __);
}


/// @nodoc


class _InitialEvent implements ImageEvent {
  const _InitialEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageEvent.initial()';
}


}




/// @nodoc


class _GetImagesEvent implements ImageEvent {
  const _GetImagesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetImagesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageEvent.getImages()';
}


}




/// @nodoc


class _GetOneImageEvent implements ImageEvent {
  const _GetOneImageEvent({required this.id});
  

 final  int id;

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetOneImageEventCopyWith<_GetOneImageEvent> get copyWith => __$GetOneImageEventCopyWithImpl<_GetOneImageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetOneImageEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ImageEvent.getOneImage(id: $id)';
}


}

/// @nodoc
abstract mixin class _$GetOneImageEventCopyWith<$Res> implements $ImageEventCopyWith<$Res> {
  factory _$GetOneImageEventCopyWith(_GetOneImageEvent value, $Res Function(_GetOneImageEvent) _then) = __$GetOneImageEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$GetOneImageEventCopyWithImpl<$Res>
    implements _$GetOneImageEventCopyWith<$Res> {
  __$GetOneImageEventCopyWithImpl(this._self, this._then);

  final _GetOneImageEvent _self;
  final $Res Function(_GetOneImageEvent) _then;

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_GetOneImageEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SelectImageEvent implements ImageEvent {
  const _SelectImageEvent({this.image});
  

 final  ImageModel? image;

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectImageEventCopyWith<_SelectImageEvent> get copyWith => __$SelectImageEventCopyWithImpl<_SelectImageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectImageEvent&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'ImageEvent.selectImage(image: $image)';
}


}

/// @nodoc
abstract mixin class _$SelectImageEventCopyWith<$Res> implements $ImageEventCopyWith<$Res> {
  factory _$SelectImageEventCopyWith(_SelectImageEvent value, $Res Function(_SelectImageEvent) _then) = __$SelectImageEventCopyWithImpl;
@useResult
$Res call({
 ImageModel? image
});


$ImageModelCopyWith<$Res>? get image;

}
/// @nodoc
class __$SelectImageEventCopyWithImpl<$Res>
    implements _$SelectImageEventCopyWith<$Res> {
  __$SelectImageEventCopyWithImpl(this._self, this._then);

  final _SelectImageEvent _self;
  final $Res Function(_SelectImageEvent) _then;

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = freezed,}) {
  return _then(_SelectImageEvent(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageModel?,
  ));
}

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

/// @nodoc


class _ChooseImageEvent implements ImageEvent {
  const _ChooseImageEvent({this.image, this.reset});
  

 final  File? image;
 final  bool? reset;

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChooseImageEventCopyWith<_ChooseImageEvent> get copyWith => __$ChooseImageEventCopyWithImpl<_ChooseImageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChooseImageEvent&&(identical(other.image, image) || other.image == image)&&(identical(other.reset, reset) || other.reset == reset));
}


@override
int get hashCode => Object.hash(runtimeType,image,reset);

@override
String toString() {
  return 'ImageEvent.chooseImage(image: $image, reset: $reset)';
}


}

/// @nodoc
abstract mixin class _$ChooseImageEventCopyWith<$Res> implements $ImageEventCopyWith<$Res> {
  factory _$ChooseImageEventCopyWith(_ChooseImageEvent value, $Res Function(_ChooseImageEvent) _then) = __$ChooseImageEventCopyWithImpl;
@useResult
$Res call({
 File? image, bool? reset
});




}
/// @nodoc
class __$ChooseImageEventCopyWithImpl<$Res>
    implements _$ChooseImageEventCopyWith<$Res> {
  __$ChooseImageEventCopyWithImpl(this._self, this._then);

  final _ChooseImageEvent _self;
  final $Res Function(_ChooseImageEvent) _then;

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = freezed,Object? reset = freezed,}) {
  return _then(_ChooseImageEvent(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,reset: freezed == reset ? _self.reset : reset // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class _UploadImageEvent implements ImageEvent {
  const _UploadImageEvent({required this.image});
  

 final  File image;

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadImageEventCopyWith<_UploadImageEvent> get copyWith => __$UploadImageEventCopyWithImpl<_UploadImageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadImageEvent&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'ImageEvent.uploadImage(image: $image)';
}


}

/// @nodoc
abstract mixin class _$UploadImageEventCopyWith<$Res> implements $ImageEventCopyWith<$Res> {
  factory _$UploadImageEventCopyWith(_UploadImageEvent value, $Res Function(_UploadImageEvent) _then) = __$UploadImageEventCopyWithImpl;
@useResult
$Res call({
 File image
});




}
/// @nodoc
class __$UploadImageEventCopyWithImpl<$Res>
    implements _$UploadImageEventCopyWith<$Res> {
  __$UploadImageEventCopyWithImpl(this._self, this._then);

  final _UploadImageEvent _self;
  final $Res Function(_UploadImageEvent) _then;

/// Create a copy of ImageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_UploadImageEvent(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

// dart format on
