part of 'category_bloc.dart';

@freezed
sealed class CategoryState with _$CategoryState {
  const factory CategoryState({
    required CategStatus status,
    required ManageCategStatus manageStatus,
    required List<CategModel> fetchedCategoriesList,
    required List<CategModel> animatedCategoriesList,
    required List<CategModel> filterCategoriesList,
    required int totalCateg,
    required int pages,
    required int currentPage,
    String? errorMessage,
  }) = _CategoryState;

  static initState() => CategoryState(
    status: CategStatus.initial,
    manageStatus: ManageCategStatus.initial,
    fetchedCategoriesList: [],
    animatedCategoriesList: [],
    filterCategoriesList: [],
    errorMessage: null,
    totalCateg: 0,
    pages: 0,
    currentPage: 0,
  );
}

enum CategStatus { initial, loading, success, error }

enum ManageCategStatus { initial, loading, success, error }
