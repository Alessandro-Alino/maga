import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/models/categories_model.dart';
import 'package:maga/models/products_model.dart';

class CategTemp {
  const CategTemp(
      {required this.id,
      required this.name,
      required this.slug,
      required this.checked});

  final int id;
  final String name;
  final String slug;
  final bool checked;

  CategTemp copyWith({int? id, String? name, String? slug, bool? checked}) {
    return CategTemp(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      checked: checked ?? this.checked,
    );
  }
}

final categID = StateProvider<int?>((ref) => null);
final categParentID = StateProvider<int?>((ref) => null);
final nameCategContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final descCategContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final loadCateg = StateProvider<bool>((ref) => false);

final categProvider =
    StateNotifierProvider<CategCheckedNotifier, List<CategTemp>>((ref) {
  return CategCheckedNotifier();
});

class CategCheckedNotifier extends StateNotifier<List<CategTemp>> {
  CategCheckedNotifier() : super([]);

  void addToCategList(List<CategoriesModel> list) {
    List<CategTemp> categTempList = list
        .map((e) =>
            CategTemp(id: e.id, name: e.name, slug: e.slug, checked: false))
        .toList();
    state = [...state, ...categTempList];
  }

  void nextCalling(WidgetRef ref) {
    ref.read(pageCategAPI.notifier).state++;
    ref.watch(categFutureProvider);
  }

  void restart(WidgetRef ref) {
    state.clear();
    ref.watch(categoriesList).clear();
    ref.watch(noMoreCateg.notifier).state = false;
    ref.read(pageCategAPI.notifier).state = 1;
    ref.refresh(categFutureProvider.future).then((value) {});
  }

  void toggle(int categTempID) {
    state = [
      for (final categ in state)
        if (categ.id == categTempID)
          categ.copyWith(checked: !categ.checked)
        else
          categ,
    ];
  }

  void allToggleFalse() {
    state = [for (final categTemp in state) categTemp.copyWith(checked: false)];
  }

  void containsCheck(Category? categ) {
    if (categ == null) {
      state = [for (final todo in state) todo.copyWith(checked: false)];
    } else {
      state = [
        for (final todo in state)
          if (todo.id == categ.id) todo.copyWith(checked: true) else todo
      ];
    }
  }
}

//
//Chiamata per leggere categorie
//
final noMoreCateg = StateProvider<bool>((ref) => false);
final pageCategAPI = StateProvider<int>((ref) => 1);
final categoriesList = StateProvider<List<CategoriesModel>>((ref) => []);
final categFutureProvider = FutureProvider<List<CategoriesModel>>((ref) async {
  //Call From the API
  debugPrint('Chiamata Categorie ${ref.watch(pageCategAPI)}');
  final List response = await ref.watch(wcAPI).getAsync(
      'wp-json/wc/v3/products/categories?per_page=100&page=${ref.watch(pageCategAPI)}');
  ////Response in a Temp List
  List<CategoriesModel> newCategoriesList =
      response.map((e) => CategoriesModel.fromJson(e)).toList();
  //If response List is Empty, stop call
  if (newCategoriesList.isEmpty) {
    ref.read(noMoreCateg.notifier).state = true;
  }
  //add list to state.
  else {
    ref.read(categProvider.notifier).addToCategList(newCategoriesList);
    ref.read(categoriesList).addAll(newCategoriesList);
  }
  return ref.watch(categoriesList);
});

//
//Creare Prodotto
//
final loadingCategBool = StateProvider<bool>((ref) => false);
final creaCateg = FutureProvider.family<void, Map>((ref, data) async {
  try {
    await ref.watch(wcAPI).postAsync('wp-json/wc/v3/products/categories', data);
  } catch (e) {
    debugPrint('Error Create Categories ${e.toString()}');
  }
});
//
//Aggiorna Prodotto
//
final updateCateg =
    FutureProvider.family<void, CategoriesModel>((ref, categ) async {
  try {
    await ref.watch(wcAPI).postAsync(
        'wp-json/wc/v3/products/categories/${categ.id}', categ.toJson());
  } catch (e) {
    debugPrint('Error Update Categories ${e.toString()}');
  }
});
