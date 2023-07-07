import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maga/controllers/connectivity_check.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/controllers/media_provider.dart';
import 'package:maga/controllers/prod_provider.dart';
import 'package:maga/models/media_wp_model.dart';

class AddMedia extends ConsumerWidget {
  const AddMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var connection = ref.watch(connectivityStatusProviders);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  ref.watch(imagex).isEmpty
                      ? null
                      : ref.read(imageWPProvider.notifier).deselectImageTemp();
                },
                child: Row(
                  children: [
                    Text('${ref.watch(imagex).length} Selezionata'),
                    ref.watch(imagex).isEmpty
                        ? const Icon(Icons.check_box_outline_blank)
                        : const Icon(Icons.check_box)
                  ],
                ))
          ],
        ),
        body: RefreshIndicator(
            onRefresh: () {
              Future future = Future(
                () => ref.watch(imageWPProvider.notifier).restart(ref),
              );
              return future;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //TextField Serch MEdia
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: ref.watch(mediaTitleContr),
                            //onChanged: (text) {
                            //  ref
                            //      .read(imageWPProvider.notifier)
                            //      .searchMedia(text, ref);
                            //},
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Cerca Media')),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        ActionChip(
                            onPressed: () {
                              if (ref.watch(mediaTitleContr).text.isEmpty) {
                                ref.watch(scaffoldMex)!
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(ref
                                      .watch(snackProvider.notifier)
                                      .mySnackBar(
                                          Colors.red.shade900,
                                          Icons.dangerous,
                                          Colors.white,
                                          'Il Campo "cerca" non può essere Vuoto',
                                          Colors.white));
                              } else {
                                ref
                                    .watch(imageWPProvider.notifier)
                                    .restart(ref);
                              }
                            },
                            avatar: const Icon(Icons.search),
                            label: const Text('Cerca'))
                      ],
                    ),
                  ),
                  //Title
                  const ListTile(
                      title: Text(
                    'Tutti i Media',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  //Grid of Media
                  connection == ConnectivityStatus.isConnected
                      ? ref.watch(mediaFutureProvider).when(
                            skipLoadingOnReload: true,
                            data: (medias) {
                              return Column(
                                children: [
                                  GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 5.0,
                                        crossAxisSpacing: 5.0,
                                      ),
                                      itemCount: medias.length,
                                      itemBuilder: (context, index) {
                                        if (medias.isEmpty) {
                                          return const Center(
                                            child: Text('nessun Risultato'),
                                          );
                                        } else {
                                          MediaWpModel media = medias[index];
                                          return MediaCard(index, media: media);
                                        }
                                      }),
                                  //Load More Products
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ref
                                              .watch(mediaFutureProvider)
                                              .isLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ref.watch(noMoreMedia)
                                              ? const Text('Nessun altro Media')
                                              : ActionChip(
                                                  avatar: const Icon(Icons.add),
                                                  label: const Text('Altro'),
                                                  onPressed: () {
                                                    if (ref.watch(
                                                            pageMediaAPI) ==
                                                        ref.watch(
                                                            pageMediaLimit)) {
                                                      ref
                                                          .read(noMoreMedia
                                                              .notifier)
                                                          .state = true;
                                                    } else {
                                                      ref
                                                          .watch(imageWPProvider
                                                              .notifier)
                                                          .nextCallingMedia(
                                                              ref);
                                                    }
                                                  },
                                                ))
                                ],
                              );
                            },
                            error: (error, stackTrace) => Center(
                              child: Text('Errore $error, riprovare.'),
                            ),
                            loading: () => const Center(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator()),
                            ),
                          )
                      : const Center(
                          child: Text('Sembra non ci sia Connessione 🤨'))
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                //Navigator with animation from bottom
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const UploadMedia(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ));
          },
          child: const Icon(Icons.upload),
        ),
      ),
    );
  }
}

class MediaCard extends ConsumerWidget {
  const MediaCard(this.index, {super.key, required this.media});

  final MediaWpModel media;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        //ref.read(mediaNameContr.notifier).state.text = image.title.rendered;
        //Navigator.push(context,
        //        MaterialPageRoute(builder: (context) => ZoomMediaWPPage(image)))
        //    .then((value) {
        //  ref.read(mediaNameContr.notifier).state.clear();
        //});
      },
      onLongPress: () {
        ref.watch(imagex).isEmpty
            ? ref.read(imageWPProvider.notifier).toggle(ref, media.id)
            : ref.watch(imageWPProvider)[index].checked
                ? ref.read(imageWPProvider.notifier).toggle(ref, media.id)
                : ref.watch(scaffoldMex)!.showSnackBar(ref
                    .watch(snackProvider.notifier)
                    .mySnackBar(Colors.red.shade800, Icons.block, Colors.white,
                        'Solo un elemento alla volta!', Colors.white));
      },
      child: Stack(
        children: [
          Hero(
            tag: media.id,
            child: Center(
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: Card(
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: media.mimeType == 'image/svg+xml'
                          ? const Center(child: Text('svg'))
                          : CachedNetworkImage(
                              width: 100.0,
                              height: 100.0,
                              imageUrl: media.sourceUrl,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => SizedBox(
                                width: 100.0,
                                height: 100.0,
                                child: Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //Check visibile if image is selcted
          Visibility(
            visible: ref.watch(imageWPProvider)[index].checked,
            child: Positioned(
              top: 5.0,
              right: 5.0,
              child: Card(
                elevation: 5,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UploadMedia extends ConsumerWidget {
  const UploadMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                ref.watch(xFile) == null
                    ? null
                    : ref.read(xFile.notifier).state = null;
              },
              child: const Row(
                children: [Text('Annulla'), Icon(Icons.delete)],
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 350,
            height: 350,
            child: ref.watch(xFile) == null
                ? const Card(
                    elevation: 5.0,
                    child: Center(child: Text('Carica una foto o Scatta ora')))
                : Card(
                    elevation: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.file(File(ref.watch(xFile)!.path),
                          fit: BoxFit.contain),
                    ),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: ActionChip(
                  onPressed: () async {
                    if (Platform.isWindows) {
                      ref.watch(scaffoldMex)!
                        ..removeCurrentSnackBar()
                        ..showSnackBar(ref
                            .watch(snackProvider.notifier)
                            .mySnackBar(
                                Colors.amber.shade900,
                                Icons.error,
                                Colors.white,
                                'Disponibile solo su dispositivi mobili',
                                Colors.white));
                    } else {
                      //NAME OF PIC
                      //ref.watch(mediaNameBeforeUploadContr.notifier)
                      //        .state
                      //        .text =
                      //    File(ref.watch(xFile)!.path).path.split('\\').last;
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (pickedFile != null) {
                        ref.read(xFile.notifier).state = XFile(pickedFile.path);
                      }
                    }
                  },
                  label: const Text('Scatta Ora'),
                ),
              ),
              SizedBox(
                child: ActionChip(
                  onPressed: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      ref.read(xFile.notifier).state = XFile(pickedFile.path);
                    }
                  },
                  label: const Text('Galleria'),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: ref.watch(xFile) == null
          ? null
          : FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.upload),
              label: const Text('Carica'),
            ),
    );
  }
}
