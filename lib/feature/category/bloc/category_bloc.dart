import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maga/feature/category/model/category.dart';
import 'package:maga/feature/category/repo/category_repo.dart';
import 'package:maga/feature/category/widget/card_categ.dart';

part 'category_state.dart';

part 'category_event.dart';

part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categRepo;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  CategoryBloc(this.categRepo) : super(CategoryState.initState()) {
    on<_InitialEvent>((event, emit) => _initial(event, emit));
    on<_GetCategoriesEvent>(
      (event, emit) async => await _getCategories(event, emit),
    );
    on<_CreateCategoriesEvent>(
      (event, emit) async => await _createCategory(event, emit, event.category),
    );
    on<_UpdateCategoriesEvent>(
      (event, emit) async => await _updateCategory(event, emit, event.category),
    );
    on<_DeleteCategoriesEvent>(
      (event, emit) async => await _deleteCategory(event, emit, event.category),
    );
    on<_FilterCategoriesEvent>(
      (event, emit) async =>
          await _filterCategories(event, emit, event.inputText),
    );
  }

  //-------------------------------//

  // Initial
  initial() => add(CategoryEvent.initial());

  // Get Categories
  getCategories() => add(CategoryEvent.getCategories());

  // Create Category
  createCategory({required CategModel category}) =>
      add(CategoryEvent.createCategories(category: category));

  // Update Category
  updateCategory({required CategModel category}) =>
      add(CategoryEvent.updateCategories(id: category.id!, category: category));

  // Delete Category
  deleteCategory({required CategModel category}) =>
      add(CategoryEvent.deleteCategories(category: category));

  // Filter Categories
  filterCategories({required String inputText}) =>
      add(CategoryEvent.filterCategories(inputText: inputText));

  //-------------------------------//

  // _Initial
  _initial(CategoryEvent event, Emitter<CategoryState> emit) {
    emit(CategoryState.initState());
  }

  // _Get Categories
  Future<void> _getCategories(
    CategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CategStatus.loading,
        manageStatus: ManageCategStatus.initial,
      ),
    );
    int page = 1;
    int perPage = 100;
    List<CategModel> categoryList = [];
    try {
      Response<dynamic> response = await categRepo.getCategories(
        page: page,
        perPage: perPage,
      );
      // Total number Categories
      int totalCateg = int.parse(
        response.headers.map.entries
            .singleWhere((e) => e.key == 'x-wp-total')
            .value
            .first,
      );
      // Total Pages
      int pages = int.parse(
        response.headers.map.entries
            .singleWhere((e) => e.key == 'x-wp-totalpages')
            .value
            .first,
      );
      // Category List
      List<CategModel> firstCategoryList =
          (response.data as List).map((e) => CategModel.fromJson(e)).toList();
      // Add Element to List
      categoryList.addAll(firstCategoryList);
      // Pagination
      while (page < pages) {
        page++;
        Response<dynamic> nextResponse = await categRepo.getCategories(
          page: page,
          perPage: perPage,
        );
        List<CategModel> nextPageCategories =
            (nextResponse.data as List)
                .map((e) => CategModel.fromJson(e))
                .toList();
        categoryList.addAll(nextPageCategories);
        // updateCategoryList(categoryList);
        // emit(
        //   state.copyWith(
        //     status: CategStatus.success,
        //     fetchedCategoriesList: categoryList,
        //     filterCategoriesList: categoryList,
        //     animatedCategoriesList: categoryList,
        //     totalCateg: totalCateg,
        //     pages: pages,
        //     currentPage: page,
        //   ),
        // );
      }
      updateCategoryList(categoryList);
      emit(
        state.copyWith(
          status: CategStatus.success,
          fetchedCategoriesList: categoryList,
          filterCategoriesList: categoryList,
          animatedCategoriesList: categoryList,
          totalCateg: totalCateg,
          pages: pages,
          currentPage: page,
        ),
      );
    } catch (e) {
      log('BLOC: Error to Fetch Categories: $e');
      emit(state.copyWith(status: CategStatus.error, errorMessage: '$e'));
    }
  }

  // Animation List
  void updateCategoryList(List<CategModel> newList) {
    final currentList = List<CategModel>.from(state.animatedCategoriesList);

    // Crea Set per confronti rapidi
    final Set<int?> currentIds = currentList.map((item) => item.id).toSet();
    final Set<int?> newIds = newList.map((item) => item.id).toSet();

    // Delete Element (backwards)
    Set<int?> idsRemove = currentIds.difference(newIds);
    for (int i = currentList.length - 1; i >= 0; i--) {
      if (idsRemove.contains(currentList[i].id)) {
        final categoryRemove = currentList[i];
        listKey.currentState?.removeItem(
          i,
          (context, animation) =>
              CardCategRemoved(animation: animation, category: categoryRemove),
          duration: const Duration(milliseconds: 1500),
        );
      }
    }
    // Add Element
    Set<int?> idsAdd = newIds.difference(currentIds);
    for (int i = 0; i < newList.length; i++) {
      if (idsAdd.contains(newList[i].id)) {
        listKey.currentState?.insertItem(
          i,
          duration: const Duration(milliseconds: 500),
        );
      }
    }
  }

  // _Create Category
  _createCategory(
    CategoryEvent event,
    Emitter<CategoryState> emit,
    CategModel category,
  ) async {
    emit(state.copyWith(manageStatus: ManageCategStatus.loading));
    try {
      final dynamic result = await categRepo.createCategories(
        category.toJson(),
      );
      log('BLOC: Create Category: $result');
      emit(state.copyWith(manageStatus: ManageCategStatus.success));
      getCategories();
    } catch (e) {
      log('BLOC: Error to Create Category: $e');
      emit(
        state.copyWith(
          manageStatus: ManageCategStatus.error,
          errorMessage: '$e',
        ),
      );
    }
  }

  // _Update Category
  _updateCategory(
    CategoryEvent event,
    Emitter<CategoryState> emit,
    CategModel category,
  ) async {
    emit(
      state.copyWith(
        manageStatus: ManageCategStatus.loading,
        idCategManaged: category.id,
      ),
    );
    try {
      final dynamic result = await categRepo.updateCategories(
        category.id as int,
        category.toJson(),
      );
      log('BLOC: Update Category: $result');
      emit(
        state.copyWith(
          manageStatus: ManageCategStatus.success,
          idCategManaged: null,
        ),
      );
      getCategories();
    } catch (e) {
      log('BLOC: Error to Update Category: $e');
      emit(
        state.copyWith(
          manageStatus: ManageCategStatus.error,
          errorMessage: '$e',
          idCategManaged: null,
        ),
      );
    }
  }

  // _Delete Category
  _deleteCategory(
    CategoryEvent event,
    Emitter<CategoryState> emit,
    CategModel category,
  ) async {
    emit(
      state.copyWith(
        manageStatus: ManageCategStatus.loading,
        idCategManaged: category.id,
      ),
    );
    try {
      await categRepo.deleteCategories(category.id!);
      log('BLOC: Delete Category: ${category.id}');
      emit(
        state.copyWith(
          manageStatus: ManageCategStatus.success,
          idCategManaged: null,
        ),
      );
      getCategories();
    } catch (e) {
      log('BLOC: Error to Delete Category : $e');
      emit(
        state.copyWith(
          manageStatus: ManageCategStatus.error,
          errorMessage: '$e',
          idCategManaged: null,
        ),
      );
    }
  }

  // _FilterCategories
  _filterCategories(
    CategoryEvent event,
    Emitter<CategoryState> emit,
    String inputText,
  ) {
    List<CategModel> fetchedCategoriesList = List.from(
      state.fetchedCategoriesList,
    );

    List<CategModel> filterCategoriesList =
        fetchedCategoriesList
            .where(
              (e) => e.name.toLowerCase().contains(inputText.toLowerCase()),
            )
            .toList();

    emit(
      state.copyWith(
        filterCategoriesList:
            inputText.isEmpty
                ? state.animatedCategoriesList
                : filterCategoriesList,
      ),
    );
  }
}
