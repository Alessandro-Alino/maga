import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/controllers/media_provider.dart';
import 'package:maga/controllers/prod_provider.dart';
import 'package:maga/models/categories_model.dart';
import 'package:maga/models/products_model.dart';
import 'package:maga/screens/add_media.dart';
import 'package:maga/widgets/categs_selecter.dart';
import 'package:maga/widgets/my_drawer.dart';
import 'package:maga/widgets/prod_card.dart';

class HomePageMaga extends ConsumerWidget {
  const HomePageMaga({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('I-COM'),
        ),
        drawer: const MyDrawer(),
        body: RefreshIndicator(
          onRefresh: () {
            Future future =
                Future(() => ref.watch(prodProvider.notifier).restart(ref));
            return ref.watch(prodFutureProvider).isLoading
                ? Future(() {})
                : future;
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 250.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.2,
                  centerTitle: true,
                  titlePadding: const EdgeInsets.all(0.0),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/image_logo_upscaled.png',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  title: //Category Selector
                      Card(
                          elevation: 5.0,
                          color: ref.watch(isLightMode)
                              ? CardTheme.of(context).color
                              : Colors.blueGrey.shade800,
                          child: ref.watch(categFutureProvider).when(
                            data: (categs) {
                              return ListTile(
                                onTap: () {
                                  ref.watch(prodFutureProvider).isLoading
                                      ? null
                                      : showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CategsSelecter(categs);
                                          });
                                },
                                title: ref.watch(categID) == null
                                    ? const Text(
                                        'Seleziona una Categoria',
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        categs
                                            .where((e) =>
                                                e.id == ref.watch(categID))
                                            .first
                                            .name,
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                trailing: const Icon(Icons.catching_pokemon),
                              );
                            },
                            error: (error, stackTrace) {
                              return ListTile(
                                title: const Text('Errore, Riprova'),
                                onTap: () {},
                              );
                            },
                            loading: () {
                              return const ListTile(
                                title: Text('Caricamento...'),
                                trailing: CircularProgressIndicator(),
                              );
                            },
                          )),
                ),
              ),
              SliverToBoxAdapter(
                  child: ref.watch(prodFutureProvider).when(
                        skipLoadingOnRefresh: false,
                        skipLoadingOnReload: true,
                        data: (data) {
                          List<ProductsModel> prodList = data;
                          return Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Column(
                              children: [
                                //List of Prod
                                prodList.isEmpty
                                    ? ref.watch(prodFutureProvider).isLoading
                                        ? const SizedBox()
                                        : const Text(
                                            'Nessun Prodotto in questa Categoria 😢',
                                            style: TextStyle(fontSize: 16.0),
                                          )
                                    : ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: prodList.length,
                                        itemBuilder: (context, index) {
                                          ProductsModel prod = prodList[index];
                                          return ProdCard(
                                            prod: prod,
                                          );
                                        }),
                                //Button Next Calling
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ref.watch(prodFutureProvider).isLoading
                                          ? const CircularProgressIndicator()
                                          : prodList.isEmpty
                                              ? const SizedBox()
                                              : ref.watch(noMoreProd)
                                                  ? const Text(
                                                      'Nessun altro prodotto')
                                                  : ActionChip(
                                                      onPressed: () {
                                                        ref
                                                            .watch(prodProvider
                                                                .notifier)
                                                            .nextCalling(ref);
                                                      },
                                                      label:
                                                          const Text('Altro'))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        error: (error, stackTrace) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Errore: $error'),
                          );
                        },
                        loading: () {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isDismissible: ref.watch(loadingProdBool) ? false : true,
                context: context,
                builder: (context) {
                  return const ModalBottomAddProd();
                }).then((value) {});
          },
          child: const Icon(Icons.add),
        ));
  }
}

class ModalBottomAddProd extends ConsumerWidget {
  const ModalBottomAddProd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = StateProvider<bool>((ref) => false);

    return Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Visibility(
                  visible: ref.watch(visible),
                  child: const Flexible(
                      child: Text('Tenere premuto per creare un Prod.')));
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      ref.read(visible.notifier).state = true;
                      Future.delayed(const Duration(seconds: 3), () {
                        ref.read(visible.notifier).state = false;
                      });
                    },
                    onLongPress: () {
                      Map data = {
                        "type": "simple",
                        "manage_stock": true,
                        "status": "draft",
                        "locations": [
                          {"id": 95, "quantity": 0},
                          {"id": 96, "quantity": 0}
                        ],
                      };
                      ref.read(loadingProdBool.notifier).state = true;
                      ref.watch(creaProd(data).future).then((value) {
                        ref.read(loadingProdBool.notifier).state = false;
                        Navigator.pop(context);
                        ref.read(categID.notifier).state = 15;
                        ref.watch(prodProvider.notifier).restart(ref);
                      });
                    },
                    child: Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ref.watch(loadingProdBool)
                                ? const SizedBox(
                                    width: 25.0,
                                    height: 25.0,
                                    child: CircularProgressIndicator())
                                : const Icon(Icons.phone_android),
                            const Text('Crea Prodotto')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: ref.read(loadCateg) ? false : true,
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //Label
                                  ListTile(
                                    title: const Text(
                                      'Crea nuova categoria',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    trailing: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 5.0),
                                        onPressed: () {
                                          //Create new Categ
                                          Map data = {
                                            "name":
                                                ref.watch(nameCategContr).text,
                                            "parent": ref.watch(categParentID),
                                            "description":
                                                ref.watch(descCategContr).text,
                                            "image": [
                                              for (final imageTemp in ref
                                                  .watch(imageWPProvider)
                                                  .where((e) => e.checked)
                                                  .toList())
                                                ImageCateg(
                                                    id: imageTemp.id,
                                                    src: imageTemp.sourceUrl,
                                                    name: '',
                                                    alt: '')
                                            ],
                                          };
                                          ref.read(loadCateg.notifier).state =
                                              true;
                                          debugPrint(data.toString());
                                          ref
                                              .watch(creaCateg(data).future)
                                              .then((value) {
                                            //When Categ i Created
                                            ref.read(loadCateg.notifier).state =
                                                false;
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePageMaga()));
                                          });
                                        },
                                        child: ref.watch(loadCateg)
                                            ? const CircularProgressIndicator()
                                            : const Text('CREA')),
                                  ),
                                  //DropDown Parent Categ
                                  Consumer(builder: (BuildContext context,
                                      WidgetRef ref, Widget? child) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton(
                                          hint:
                                              const Text('Categoria Genitore'),
                                          value: ref.watch(categParentID) ==
                                                  null
                                              ? null
                                              : ref
                                                  .watch(categProvider)
                                                  .singleWhere((e) =>
                                                      e.id ==
                                                      ref.watch(categParentID))
                                                  .name,
                                          isExpanded: true,
                                          items: [
                                            ...ref
                                                .watch(categProvider)
                                                .map((e) {
                                              return DropdownMenuItem(
                                                value: e.name,
                                                onTap: () {
                                                  ref
                                                      .read(categParentID
                                                          .notifier)
                                                      .state = e.id;
                                                },
                                                child: Text(e.name),
                                              );
                                            })
                                          ],
                                          onChanged: (val) {}),
                                    );
                                  }),
                                  //Image Categ
                                  Consumer(builder: (BuildContext context,
                                      WidgetRef ref, Widget? child) {
                                    return Center(
                                      child: Container(
                                        height: 180.0,
                                        width: 180.0,
                                        margin:
                                            const EdgeInsets.only(bottom: 16.0),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            ref.watch(imagex).isNotEmpty
                                                ? Center(
                                                    child: Card(
                                                      elevation: 5.0,
                                                      child: SizedBox(
                                                        height: 150.0,
                                                        width: 150.0,
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child:
                                                                Image.network(
                                                              height: 200,
                                                              width: 200,
                                                              ref
                                                                  .watch(imagex)
                                                                  .first
                                                                  .sourceUrl,
                                                              fit: BoxFit.cover,
                                                              loadingBuilder:
                                                                  (context,
                                                                      child,
                                                                      loadingProgress) {
                                                                return loadingProgress ==
                                                                        null
                                                                    ? child
                                                                    : const Center(
                                                                        child:
                                                                            CircularProgressIndicator());
                                                              },
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  const Center(
                                                                child: Icon(
                                                                    Icons
                                                                        .error),
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  )
                                                : Center(
                                                    child: Card(
                                                      elevation: 5.0,
                                                      child: SizedBox(
                                                        height: 150.0,
                                                        width: 150.0,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            width: 200.0,
                                                            height: 200.0,
                                                            imageUrl:
                                                                'https://alealino.com/wp-content/uploads/woocommerce-placeholder.png',
                                                            fit: BoxFit.cover,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    SizedBox(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              child: Center(
                                                                child: CircularProgressIndicator(
                                                                    value: downloadProgress
                                                                        .progress),
                                                              ),
                                                            ),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Icon(Icons
                                                                    .error),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            //Mini FAB to Select image
                                            Visibility(
                                              visible:
                                                  ref.watch(imagex).isEmpty,
                                              child: Positioned(
                                                bottom: 0.0,
                                                right: 0.0,
                                                child: FloatingActionButton(
                                                  mini: true,
                                                  heroTag: 'media',
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const AddMedia())).then(
                                                        (value) {});
                                                  },
                                                  child: const Icon(Icons.add),
                                                ),
                                              ),
                                            ),
                                            //Icon to cancel imagex selected
                                            Visibility(
                                              visible:
                                                  ref.watch(imagex).isNotEmpty,
                                              child: Positioned(
                                                  child: FloatingActionButton(
                                                heroTag: 'delImagex',
                                                mini: true,
                                                backgroundColor: Colors.red,
                                                onPressed: () {
                                                  ref.watch(imagex).isEmpty
                                                      ? null
                                                      : ref
                                                          .read(imageWPProvider
                                                              .notifier)
                                                          .deselectImageTemp();
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                  //TextFieln Categ Name
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: ref.watch(nameCategContr),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Nome Categoria',
                                      ),
                                    ),
                                  ),
                                  //Cate Description
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: //TextField Descrizione
                                        TextFormField(
                                      maxLines: 8,
                                      controller: ref.watch(descCategContr),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Descrizione',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).then((value) {
                        //Clear CategParendID when close modal
                        ref.read(categParentID.notifier).state = null;
                        //Clear Imegex if Selected when close modal
                        ref.watch(imagex).isEmpty
                            ? null
                            : ref
                                .read(imageWPProvider.notifier)
                                .deselectImageTemp();
                        //Clear Name Categ when close modal
                        ref.watch(nameCategContr).clear();
                        //Clear Desc Categ when close modal
                        ref.watch(descCategContr).clear();
                      });
                    },
                    child: const Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.category),
                            Text('Crea Categoria')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
