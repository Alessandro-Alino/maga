import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/models/products_model.dart';

final xFile = StateProvider<XFile?>((ref) => null);
//TextFormField Controller for CRUD Product
final nameProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final descProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final specProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final regPriceProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final salePriceProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final reginaProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final tagliaProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final seoKWProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final brandProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final eanProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final gtinProdContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final statusProd = StateProvider<String?>((ref) => null);
final noMoreProd = StateProvider<bool>((ref) => false);
final pageProdAPI = StateProvider<int>((ref) => 1);
final listProdFilter = StateProvider<List<ProductsModel>>((ref) => []);
final prodProvider =
    StateNotifierProvider<ProdNotifier, List<ProductsModel>>((ref) {
  return ProdNotifier();
});

class ProdNotifier extends StateNotifier<List<ProductsModel>> {
  ProdNotifier() : super([]);

  void addToProdList(List<ProductsModel> list) {
    state = [...state, ...list];
  }

  void nextCalling(WidgetRef ref) {
    ref.read(pageProdAPI.notifier).state++;
    ref.watch(prodFutureProvider);
  }

  void restart(WidgetRef ref) {
    state.clear();
    ref.watch(noMoreProd.notifier).state = false;
    ref.read(pageProdAPI.notifier).state = 1;
    ref.refresh(prodFutureProvider.future).then((value) => null);
  }

  void clearList() {
    state.clear();
  }
}

//
//Chiamata per leggere i prodotti
//
final prodFutureProvider = FutureProvider<List<ProductsModel>>((ref) async {
  //Call From the API
  debugPrint('Chiamata Prodotti ${ref.watch(pageProdAPI)}');
  final List response = await ref.watch(wcAPI).getAsync(
      'wp-json/wc/v3/products?category=${ref.watch(categID)}&page=${ref.watch(pageProdAPI)}'); //&per_page=50
  //Response in a Temp List
  final newProductsList =
      response.map((e) => ProductsModel.fromJson(e)).toList();
  //If response List is Empty, stop call
  if (newProductsList.isEmpty) {
    ref.read(noMoreProd.notifier).state = true;
  }
  //add list to state.
  else {
    ref.watch(prodProvider.notifier).addToProdList(newProductsList);
  }
  return ref.watch(prodProvider);
});

//
//Creare Prodotto
//
final loadingProdBool = StateProvider<bool>((ref) => false);
final creaProd = FutureProvider((ref) async {
  Map data = {
    "type": "simple",
    "manage_stock": true,
    "status": "draft",
    "locations": [
      {"id": 95, "quantity": 0},
      {"id": 96, "quantity": 0}
    ],
  };
  try {
    await ref.watch(wcAPI).postAsync('wp-json/wc/v3/products', data);
  } catch (e) {
    debugPrint('Error Error Create Product ${e.toString()}');
  }
});
//
//Modificare Prodotto
//
final updateProd =
    FutureProvider.family<void, ProductsModel>((ref, prod) async {
  try {
    await ref
        .watch(wcAPI)
        .postAsync('wp-json/wc/v3/products/${prod.id}', prod.toJson());
  } catch (e) {
    debugPrint('Error Error Update Product ${e.toString()}');
  }
});
//
//Eliminare Prodotto
//
final isLoadingDelete = StateProvider<bool>((ref) => false);
final deleteProd =
    FutureProvider.family<void, ProductsModel>((ref, prod) async {
  try {
    await ref.watch(wcAPI).deleteAsync(
          'wp-json/wc/v3/products/${prod.id}',
        );
  } catch (e) {
    debugPrint('Error Error Delete Product ${e.toString()}');
  }
});
