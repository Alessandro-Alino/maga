// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {

 CategStatus get status; ManageCategStatus get manageStatus; List<CategModel> get fetchedCategoriesList; List<CategModel> get animatedCategoriesList; List<CategModel> get filterCategoriesList; int get totalCateg; int get pages; int get currentPage; String? get errorMessage; int? get idCategManaged;
/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryStateCopyWith<CategoryState> get copyWith => _$CategoryStateCopyWithImpl<CategoryState>(this as CategoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState&&(identical(other.status, status) || other.status == status)&&(identical(other.manageStatus, manageStatus) || other.manageStatus == manageStatus)&&const DeepCollectionEquality().equals(other.fetchedCategoriesList, fetchedCategoriesList)&&const DeepCollectionEquality().equals(other.animatedCategoriesList, animatedCategoriesList)&&const DeepCollectionEquality().equals(other.filterCategoriesList, filterCategoriesList)&&(identical(other.totalCateg, totalCateg) || other.totalCateg == totalCateg)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.idCategManaged, idCategManaged) || other.idCategManaged == idCategManaged));
}


@override
int get hashCode => Object.hash(runtimeType,status,manageStatus,const DeepCollectionEquality().hash(fetchedCategoriesList),const DeepCollectionEquality().hash(animatedCategoriesList),const DeepCollectionEquality().hash(filterCategoriesList),totalCateg,pages,currentPage,errorMessage,idCategManaged);

@override
String toString() {
  return 'CategoryState(status: $status, manageStatus: $manageStatus, fetchedCategoriesList: $fetchedCategoriesList, animatedCategoriesList: $animatedCategoriesList, filterCategoriesList: $filterCategoriesList, totalCateg: $totalCateg, pages: $pages, currentPage: $currentPage, errorMessage: $errorMessage, idCategManaged: $idCategManaged)';
}


}

/// @nodoc
abstract mixin class $CategoryStateCopyWith<$Res>  {
  factory $CategoryStateCopyWith(CategoryState value, $Res Function(CategoryState) _then) = _$CategoryStateCopyWithImpl;
@useResult
$Res call({
 CategStatus status, ManageCategStatus manageStatus, List<CategModel> fetchedCategoriesList, List<CategModel> animatedCategoriesList, List<CategModel> filterCategoriesList, int totalCateg, int pages, int currentPage, String? errorMessage, int? idCategManaged
});




}
/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._self, this._then);

  final CategoryState _self;
  final $Res Function(CategoryState) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? manageStatus = null,Object? fetchedCategoriesList = null,Object? animatedCategoriesList = null,Object? filterCategoriesList = null,Object? totalCateg = null,Object? pages = null,Object? currentPage = null,Object? errorMessage = freezed,Object? idCategManaged = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CategStatus,manageStatus: null == manageStatus ? _self.manageStatus : manageStatus // ignore: cast_nullable_to_non_nullable
as ManageCategStatus,fetchedCategoriesList: null == fetchedCategoriesList ? _self.fetchedCategoriesList : fetchedCategoriesList // ignore: cast_nullable_to_non_nullable
as List<CategModel>,animatedCategoriesList: null == animatedCategoriesList ? _self.animatedCategoriesList : animatedCategoriesList // ignore: cast_nullable_to_non_nullable
as List<CategModel>,filterCategoriesList: null == filterCategoriesList ? _self.filterCategoriesList : filterCategoriesList // ignore: cast_nullable_to_non_nullable
as List<CategModel>,totalCateg: null == totalCateg ? _self.totalCateg : totalCateg // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,idCategManaged: freezed == idCategManaged ? _self.idCategManaged : idCategManaged // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc


class _CategoryState implements CategoryState {
  const _CategoryState({required this.status, required this.manageStatus, required final  List<CategModel> fetchedCategoriesList, required final  List<CategModel> animatedCategoriesList, required final  List<CategModel> filterCategoriesList, required this.totalCateg, required this.pages, required this.currentPage, this.errorMessage, this.idCategManaged}): _fetchedCategoriesList = fetchedCategoriesList,_animatedCategoriesList = animatedCategoriesList,_filterCategoriesList = filterCategoriesList;
  

@override final  CategStatus status;
@override final  ManageCategStatus manageStatus;
 final  List<CategModel> _fetchedCategoriesList;
@override List<CategModel> get fetchedCategoriesList {
  if (_fetchedCategoriesList is EqualUnmodifiableListView) return _fetchedCategoriesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fetchedCategoriesList);
}

 final  List<CategModel> _animatedCategoriesList;
@override List<CategModel> get animatedCategoriesList {
  if (_animatedCategoriesList is EqualUnmodifiableListView) return _animatedCategoriesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_animatedCategoriesList);
}

 final  List<CategModel> _filterCategoriesList;
@override List<CategModel> get filterCategoriesList {
  if (_filterCategoriesList is EqualUnmodifiableListView) return _filterCategoriesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filterCategoriesList);
}

@override final  int totalCateg;
@override final  int pages;
@override final  int currentPage;
@override final  String? errorMessage;
@override final  int? idCategManaged;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryStateCopyWith<_CategoryState> get copyWith => __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryState&&(identical(other.status, status) || other.status == status)&&(identical(other.manageStatus, manageStatus) || other.manageStatus == manageStatus)&&const DeepCollectionEquality().equals(other._fetchedCategoriesList, _fetchedCategoriesList)&&const DeepCollectionEquality().equals(other._animatedCategoriesList, _animatedCategoriesList)&&const DeepCollectionEquality().equals(other._filterCategoriesList, _filterCategoriesList)&&(identical(other.totalCateg, totalCateg) || other.totalCateg == totalCateg)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.idCategManaged, idCategManaged) || other.idCategManaged == idCategManaged));
}


@override
int get hashCode => Object.hash(runtimeType,status,manageStatus,const DeepCollectionEquality().hash(_fetchedCategoriesList),const DeepCollectionEquality().hash(_animatedCategoriesList),const DeepCollectionEquality().hash(_filterCategoriesList),totalCateg,pages,currentPage,errorMessage,idCategManaged);

@override
String toString() {
  return 'CategoryState(status: $status, manageStatus: $manageStatus, fetchedCategoriesList: $fetchedCategoriesList, animatedCategoriesList: $animatedCategoriesList, filterCategoriesList: $filterCategoriesList, totalCateg: $totalCateg, pages: $pages, currentPage: $currentPage, errorMessage: $errorMessage, idCategManaged: $idCategManaged)';
}


}

/// @nodoc
abstract mixin class _$CategoryStateCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(_CategoryState value, $Res Function(_CategoryState) _then) = __$CategoryStateCopyWithImpl;
@override @useResult
$Res call({
 CategStatus status, ManageCategStatus manageStatus, List<CategModel> fetchedCategoriesList, List<CategModel> animatedCategoriesList, List<CategModel> filterCategoriesList, int totalCateg, int pages, int currentPage, String? errorMessage, int? idCategManaged
});




}
/// @nodoc
class __$CategoryStateCopyWithImpl<$Res>
    implements _$CategoryStateCopyWith<$Res> {
  __$CategoryStateCopyWithImpl(this._self, this._then);

  final _CategoryState _self;
  final $Res Function(_CategoryState) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? manageStatus = null,Object? fetchedCategoriesList = null,Object? animatedCategoriesList = null,Object? filterCategoriesList = null,Object? totalCateg = null,Object? pages = null,Object? currentPage = null,Object? errorMessage = freezed,Object? idCategManaged = freezed,}) {
  return _then(_CategoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CategStatus,manageStatus: null == manageStatus ? _self.manageStatus : manageStatus // ignore: cast_nullable_to_non_nullable
as ManageCategStatus,fetchedCategoriesList: null == fetchedCategoriesList ? _self._fetchedCategoriesList : fetchedCategoriesList // ignore: cast_nullable_to_non_nullable
as List<CategModel>,animatedCategoriesList: null == animatedCategoriesList ? _self._animatedCategoriesList : animatedCategoriesList // ignore: cast_nullable_to_non_nullable
as List<CategModel>,filterCategoriesList: null == filterCategoriesList ? _self._filterCategoriesList : filterCategoriesList // ignore: cast_nullable_to_non_nullable
as List<CategModel>,totalCateg: null == totalCateg ? _self.totalCateg : totalCateg // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,idCategManaged: freezed == idCategManaged ? _self.idCategManaged : idCategManaged // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$CategoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent()';
}


}

/// @nodoc
class $CategoryEventCopyWith<$Res>  {
$CategoryEventCopyWith(CategoryEvent _, $Res Function(CategoryEvent) __);
}


/// @nodoc


class _InitialEvent implements CategoryEvent {
  const _InitialEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.initial()';
}


}




/// @nodoc


class _GetCategoriesEvent implements CategoryEvent {
  const _GetCategoriesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.getCategories()';
}


}




/// @nodoc


class _CreateCategoriesEvent implements CategoryEvent {
  const _CreateCategoriesEvent({required this.category});
  

 final  CategModel category;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCategoriesEventCopyWith<_CreateCategoriesEvent> get copyWith => __$CreateCategoriesEventCopyWithImpl<_CreateCategoriesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCategoriesEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'CategoryEvent.createCategories(category: $category)';
}


}

/// @nodoc
abstract mixin class _$CreateCategoriesEventCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory _$CreateCategoriesEventCopyWith(_CreateCategoriesEvent value, $Res Function(_CreateCategoriesEvent) _then) = __$CreateCategoriesEventCopyWithImpl;
@useResult
$Res call({
 CategModel category
});


$CategModelCopyWith<$Res> get category;

}
/// @nodoc
class __$CreateCategoriesEventCopyWithImpl<$Res>
    implements _$CreateCategoriesEventCopyWith<$Res> {
  __$CreateCategoriesEventCopyWithImpl(this._self, this._then);

  final _CreateCategoriesEvent _self;
  final $Res Function(_CreateCategoriesEvent) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_CreateCategoriesEvent(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategModel,
  ));
}

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategModelCopyWith<$Res> get category {
  
  return $CategModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _UpdateCategoriesEvent implements CategoryEvent {
  const _UpdateCategoriesEvent({required this.id, required this.category});
  

 final  int id;
 final  CategModel category;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCategoriesEventCopyWith<_UpdateCategoriesEvent> get copyWith => __$UpdateCategoriesEventCopyWithImpl<_UpdateCategoriesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCategoriesEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,category);

@override
String toString() {
  return 'CategoryEvent.updateCategories(id: $id, category: $category)';
}


}

/// @nodoc
abstract mixin class _$UpdateCategoriesEventCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory _$UpdateCategoriesEventCopyWith(_UpdateCategoriesEvent value, $Res Function(_UpdateCategoriesEvent) _then) = __$UpdateCategoriesEventCopyWithImpl;
@useResult
$Res call({
 int id, CategModel category
});


$CategModelCopyWith<$Res> get category;

}
/// @nodoc
class __$UpdateCategoriesEventCopyWithImpl<$Res>
    implements _$UpdateCategoriesEventCopyWith<$Res> {
  __$UpdateCategoriesEventCopyWithImpl(this._self, this._then);

  final _UpdateCategoriesEvent _self;
  final $Res Function(_UpdateCategoriesEvent) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,}) {
  return _then(_UpdateCategoriesEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategModel,
  ));
}

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategModelCopyWith<$Res> get category {
  
  return $CategModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _DeleteCategoriesEvent implements CategoryEvent {
  const _DeleteCategoriesEvent({required this.category});
  

 final  CategModel category;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCategoriesEventCopyWith<_DeleteCategoriesEvent> get copyWith => __$DeleteCategoriesEventCopyWithImpl<_DeleteCategoriesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteCategoriesEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'CategoryEvent.deleteCategories(category: $category)';
}


}

/// @nodoc
abstract mixin class _$DeleteCategoriesEventCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory _$DeleteCategoriesEventCopyWith(_DeleteCategoriesEvent value, $Res Function(_DeleteCategoriesEvent) _then) = __$DeleteCategoriesEventCopyWithImpl;
@useResult
$Res call({
 CategModel category
});


$CategModelCopyWith<$Res> get category;

}
/// @nodoc
class __$DeleteCategoriesEventCopyWithImpl<$Res>
    implements _$DeleteCategoriesEventCopyWith<$Res> {
  __$DeleteCategoriesEventCopyWithImpl(this._self, this._then);

  final _DeleteCategoriesEvent _self;
  final $Res Function(_DeleteCategoriesEvent) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_DeleteCategoriesEvent(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategModel,
  ));
}

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategModelCopyWith<$Res> get category {
  
  return $CategModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _FilterCategoriesEvent implements CategoryEvent {
  const _FilterCategoriesEvent({required this.inputText});
  

 final  String inputText;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterCategoriesEventCopyWith<_FilterCategoriesEvent> get copyWith => __$FilterCategoriesEventCopyWithImpl<_FilterCategoriesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterCategoriesEvent&&(identical(other.inputText, inputText) || other.inputText == inputText));
}


@override
int get hashCode => Object.hash(runtimeType,inputText);

@override
String toString() {
  return 'CategoryEvent.filterCategories(inputText: $inputText)';
}


}

/// @nodoc
abstract mixin class _$FilterCategoriesEventCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory _$FilterCategoriesEventCopyWith(_FilterCategoriesEvent value, $Res Function(_FilterCategoriesEvent) _then) = __$FilterCategoriesEventCopyWithImpl;
@useResult
$Res call({
 String inputText
});




}
/// @nodoc
class __$FilterCategoriesEventCopyWithImpl<$Res>
    implements _$FilterCategoriesEventCopyWith<$Res> {
  __$FilterCategoriesEventCopyWithImpl(this._self, this._then);

  final _FilterCategoriesEvent _self;
  final $Res Function(_FilterCategoriesEvent) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inputText = null,}) {
  return _then(_FilterCategoriesEvent(
inputText: null == inputText ? _self.inputText : inputText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
