part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.initial() = _InitialEvent;

  const factory CategoryEvent.getCategories() = _GetCategoriesEvent;

  const factory CategoryEvent.createCategories({required CategModel category}) =
      _CreateCategoriesEvent;

  const factory CategoryEvent.updateCategories({
    required int id,
    required CategModel category,
  }) = _UpdateCategoriesEvent;

  const factory CategoryEvent.deleteCategories({required CategModel category}) =
      _DeleteCategoriesEvent;

  const factory CategoryEvent.filterCategories({required String inputText}) =
      _FilterCategoriesEvent;
}
