import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/controllers/media_provider.dart';
import 'package:maga/controllers/prod_provider.dart';
import 'package:maga/models/products_model.dart';
import 'package:maga/widgets/categs_selecter.dart';
import 'package:maga/widgets/modal_create_categ.dart';
import 'package:maga/widgets/my_drawer.dart';
import 'package:maga/widgets/prod_card.dart';
import 'package:maga/widgets/shimmer_loading.dart';

class HomePageMaga extends ConsumerWidget {
  const HomePageMaga({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('I-COM'),
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(categID.notifier).state = null;
                },
                icon: const Icon(Icons.dangerous))
          ],
        ),
        drawer: const MyDrawer(),
        body: RefreshIndicator(
          onRefresh: () {
            if (ref.watch(prodFutureProvider).isLoading) {
              return Future(() => null);
            } else {
              Future future =
                  Future(() => ref.watch(prodProvider.notifier).restart(ref));
              return future;
            }
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
                  //Category Selector
                  title: Card(
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
                                        .where(
                                            (e) => e.id == ref.watch(categID))
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
                            child:
                                //List of Prod
                                Column(
                              children: [
                                //Categ isn't selcted
                                ref.watch(categID) == null
                                    ? const Center(
                                        child: Text(
                                            'Per iniziare, seleziona una categoria'),
                                      )
                                    :
                                    //Categ selected but empty List Prod
                                    prodList.isEmpty
                                        ? ref
                                                .watch(prodFutureProvider)
                                                .isLoading
                                            ? const SizedBox()
                                            : const Text(
                                                'Nessun Prodotto in questa Categoria 😢',
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              )
                                        :
                                        //List Prod
                                        ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: prodList.length,
                                            itemBuilder: (context, index) {
                                              ProductsModel prod =
                                                  prodList[index];
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
                                          ? Expanded(
                                              child: ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 10,
                                                itemBuilder: (context, index) {
                                                  return const ShimmerLoading();
                                                },
                                              ),
                                            )
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return const ShimmerLoading();
                              },
                            ),
                          );
                        },
                      ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isDismissible: false,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Close Button
            Visibility(
                visible: !ref.watch(loadingProdBool),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                ])),
            //Mex
            Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Visibility(
                  visible: ref.watch(visible),
                  child: const Flexible(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Tenere premuto per creare un Prodotto!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )));
            }),
            //Cards
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageMaga()));
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
                            return const ModalBottomCreateCateg();
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
