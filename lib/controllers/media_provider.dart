import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/models/media_wp_model.dart';

class ImageTemp {
  const ImageTemp(
      {required this.id,
      required this.sourceUrl,
      required this.title,
      required this.checked});

  final int id;
  final String sourceUrl;
  final String title;
  final bool checked;

  ImageTemp copyWith(
      {int? id, String? sourceUrl, String? title, bool? checked}) {
    return ImageTemp(
      id: id ?? this.id,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      title: title ?? this.title,
      checked: checked ?? this.checked,
    );
  }
}

final mediaSearchBool = StateProvider<bool>((ref) => false);
final mediaTitleContr =
    StateProvider<TextEditingController>((ref) => TextEditingController());
//final listMediaFilter = StateProvider<List<ImageTemp>>((ref) => []);

final imageWPProvider =
    StateNotifierProvider<ImageSelectedNotifier, List<ImageTemp>>((ref) {
  return ImageSelectedNotifier();
});

class ImageSelectedNotifier extends StateNotifier<List<ImageTemp>> {
  ImageSelectedNotifier() : super([]);

  void addToImageList(List<MediaWpModel> imageTempList, String textSearched) {
    List<ImageTemp> imageTemp = imageTempList
        .map((e) => ImageTemp(
            id: e.id,
            sourceUrl: e.sourceUrl,
            title: e.title.rendered,
            checked: false))
        .where((element) => element.title
            .toLowerCase()
            .contains(textSearched.toString().toLowerCase()))
        .toList();
    state = [...state, ...imageTemp];
  }

  void toggle(WidgetRef ref, int categTempID) {
    state = [
      for (final image in state)
        if (image.id == categTempID)
          image.copyWith(checked: !image.checked)
        else
          image
    ];
  }

  searchMedia(String textSearched, WidgetRef ref) {
    state
        .where((element) => element.title
            .toLowerCase()
            .contains(textSearched.toString().toLowerCase()))
        .toList();
    //Se clicco cerca, mostra lista filtrata invece della griglia
  }

  void deselectImageTemp() {
    state = [for (final image in state) image.copyWith(checked: false)];
  }

  void restart(WidgetRef ref) {
    state.clear();
    ref.watch(noMoreMedia.notifier).state = false;
    ref.read(pageMediaAPI.notifier).state = 1;
    ref.refresh(mediaFutureProvider.future).then((value) {});
    ref.read(imageWPProvider.notifier).deselectImageTemp();
    ref.watch(mediaList).clear();
    ref.watch(imagex).clear();
  }

  void nextCallingMedia(WidgetRef ref) {
    ref.read(pageMediaAPI.notifier).state++;
    ref.watch(mediaFutureProvider);
  }
}

//TextFormField Name Media
final mediaNameContr = StateProvider((ref) => TextEditingController());
final mediaNameBeforeUploadContr =
    StateProvider((ref) => TextEditingController());

final imagex = StateProvider<List<ImageTemp>>((ref) => [
      for (final imagex
          in ref.watch(imageWPProvider).where((element) => element.checked))
        imagex
    ]);

//
//Chiamata per leggere i MEDIA
//
final isUploadMedia = StateProvider((ref) => false);
final noMoreMedia = StateProvider<bool>((ref) => false);
final pageMediaAPI = StateProvider<int>((ref) => 1);
final pageMediaLimit = StateProvider<int>((ref) => 0);
final mediaList = StateProvider<List<MediaWpModel>>((ref) => []);
final mediaFutureProvider = FutureProvider<List<MediaWpModel>>((ref) async {
  //Call From the API
  debugPrint('Chiamata Media ${ref.watch(pageMediaAPI)}');
  final List response = await ref.watch(wcAPI).getAsyncMedia(
      'wp-json/wp/v2/media?page=${ref.watch(pageMediaAPI)}&per_page=25${ref.watch(mediaSearchBool) ? '&search=${ref.watch(mediaTitleContr).text}' : ''}');
  //Response divisa in due parti, la prima ('[0]') è la lista di MEDIA, la seconda ('[1]') è il numero di pagine totali ricavato dall'header
  List test = response[0];
  ref.read(pageMediaLimit.notifier).state = int.parse(response[1]);
  final newMediaList = test.map((e) => MediaWpModel.fromJson(e)).toList();
  //add list to state.
  ref
      .read(imageWPProvider.notifier)
      .addToImageList(newMediaList, ref.watch(mediaTitleContr).text);
  ref.watch(mediaList).addAll(newMediaList);

  return ref.watch(mediaList);
});

//
//Craricare MEDIA sul server
//
final creaMedia = FutureProvider.family<void, File>((ref, data) async {
  try {
    await ref
        .watch(wcAPI)
        .postAsyncMedia('wp-json/wp/v2/media', data)
        .then((value) {});
  } catch (e) {
    debugPrint('Error Error Upload Image ${e.toString()}');
  }
});
//
//Eliminare Prodotto
//
final deleteMedia = FutureProvider.family<void, int>((ref, mediaID) async {
  try {
    await ref.watch(wcAPI).deleteAsyncMedia(
          'wp-json/wp/v2/media/$mediaID?force=true',
        );
  } catch (e) {
    debugPrint('Error Error Delete Media ${e.toString()}');
  }
});
