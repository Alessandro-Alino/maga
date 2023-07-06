import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/controllers/prod_provider.dart';
import 'package:maga/models/products_model.dart';
import 'package:maga/widgets/categs_selecter.dart';
import 'package:maga/widgets/my_drawer.dart';
import 'package:maga/widgets/prod_card.dart';

class HomePageMaga extends ConsumerWidget {
  const HomePageMaga({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
              const SliverAppBar(
                title: Text('I-COM'),
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 250.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.2,
                  centerTitle: true,
                  titlePadding: const EdgeInsets.all(0.0),
                  background: Image.asset(
                    'assets/images/image_logo_upscaled.png',
                    fit: BoxFit.cover,
                  ),
                  title: //Category Selector
                      Card(
                          elevation: 5.0,
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
                isDismissible: ref.watch(creaProd).isLoading ? false : true,
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
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Chiudi'))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      ref.read(loadingProdBool.notifier).state = true;
                      ref.watch(creaProd.future).then((value) {
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
                                ? const CircularProgressIndicator()
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
                      Navigator.pop(context);
                      ref.watch(scaffoldMex)!
                        ..removeCurrentSnackBar()
                        ..showSnackBar(ref
                            .watch(snackProvider.notifier)
                            .mySnackBar(
                                Colors.amber.shade900,
                                Icons.watch_later,
                                Colors.white,
                                'Funzione in Arrivo!',
                                Colors.white));
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
