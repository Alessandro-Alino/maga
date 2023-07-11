import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/connectivity_check.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/controllers/media_provider.dart';
import 'package:maga/controllers/prod_provider.dart';
import 'package:maga/models/categories_model.dart';
import 'package:maga/models/products_model.dart';
import 'package:maga/screens/add_media.dart';
import 'package:maga/screens/home_maga.dart';

class AddOrMod extends ConsumerWidget {
  const AddOrMod(this.prod, {super.key});

  final ProductsModel prod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Lista categorie già selezionate da passare al CustomBottomSheet
    final categTemp = ref.watch(categProvider);
    final categTempChecked = categTemp.where((e) => e.checked).toList();
    //Lista delle immagini selezionate da passare al ImageSelected
    final imageTemp = ref.watch(imageWPProvider);
    final imageTempChecked = imageTemp.where((e) => e.checked).toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Eliminare il Prodotto?'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('[${prod.id}]'),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            prod.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Close AboutDialog
                            Consumer(builder: (BuildContext context,
                                WidgetRef ref, Widget? child) {
                              return Visibility(
                                visible: !ref.watch(isLoadingDelete),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Indietro')),
                              );
                            }),
                            //Delete Product
                            ElevatedButton(
                              onPressed: () {
                                if (ref.watch(connectivityStatusProviders) ==
                                    ConnectivityStatus.isDisonnected) {
                                  ref.watch(scaffoldMex)!
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(ref
                                        .watch(snackProvider.notifier)
                                        .mySnackBar(
                                            Colors.yellow.shade800,
                                            Icons.wifi_off,
                                            Colors.white,
                                            'Problemi di connessione',
                                            Colors.white));
                                } else {
                                  //DeleteProduct
                                  ref.read(isLoadingDelete.notifier).state =
                                      true;
                                  ref
                                      .watch(deleteProd(prod).future)
                                      .then((value) {
                                    ref.read(isLoadingDelete.notifier).state =
                                        false;
                                    ref
                                        .read(prodProvider.notifier)
                                        .restart(ref);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePageMaga()));
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100.0, 10.0),
                                backgroundColor: Colors.red.shade900,
                              ),
                              child: Consumer(
                                builder: (context, ref, child) {
                                  return ref.watch(isLoadingDelete)
                                      ? const Center(
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : const Text(
                                          'Elimina',
                                          style: TextStyle(color: Colors.white),
                                        );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red.shade900,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            Center(
              child: Container(
                height: 250.0,
                width: 250.0,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ref.watch(imagex).isNotEmpty
                        ? Center(
                            child: Card(
                              elevation: 5.0,
                              child: SizedBox(
                                height: 200.0,
                                width: 200.0,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      height: 200,
                                      width: 200,
                                      ref.watch(imagex).first.sourceUrl,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        return loadingProgress == null
                                            ? child
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator());
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Center(
                                        child: Icon(Icons.error),
                                      ),
                                    )),
                              ),
                            ),
                          )
                        : Center(
                            child: Hero(
                              tag: prod.id,
                              child: Card(
                                elevation: 5.0,
                                child: SizedBox(
                                  height: 200.0,
                                  width: 200.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      width: 200.0,
                                      height: 200.0,
                                      imageUrl: prod.images.isEmpty
                                          ? 'https://alealino.com/wp-content/uploads/woocommerce-placeholder.png'
                                          : '${prod.images.first.src}',
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              SizedBox(
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
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: FloatingActionButton(
                        heroTag: 'media',
                        onPressed: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddMedia()))
                              .then((value) {
                            ref.watch(mediaTitleContr).clear();
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Status Prod
            DropdownButton(
                hint: const Text('Status'),
                value: ref.watch(statusProd),
                items: [
                  DropdownMenuItem(
                    value: 'publish',
                    onTap: () {
                      ref.read(statusProd.notifier).state = 'publish';
                    },
                    child: const Text('Pubblicato'),
                  ),
                  DropdownMenuItem(
                      value: 'draft',
                      onTap: () {
                        ref.read(statusProd.notifier).state = 'draft';
                      },
                      child: const Text('Bozze')),
                ],
                onChanged: (val) {}),
            //TextField Name Prod
            const ListTile(
              title: Text(
                'Nome Prodotto',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ref.watch(nameProdContr),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Nome Prodotto'),
                ),
              ),
            ),
            //Categorie
            const ListTile(
              title: Text(
                'Categorie',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return CustomModalBottom(
                          prod: prod,
                        );
                      }).then((value) {});
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.90, 50.0)),
                child: ListTile(
                  title: const Text(
                    'Seleziona Categorie',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: categTempChecked.isEmpty
                      ? null
                      : SizedBox(
                          height: 20,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categTempChecked.length,
                              itemBuilder: (context, index) {
                                CategTemp categ = categTempChecked[index];
                                return Text(
                                  index == categTempChecked.length - 1
                                      ? categ.name
                                      : '${categ.name}, ',
                                  style: const TextStyle(color: Colors.grey),
                                );
                              }),
                        ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ),
            ),
            //TextFields Regina and Tagliamento Quantity
            const ListTile(
              title: Text(
                'Quantità',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            prod.locations!.isEmpty
                ? ElevatedButton(
                    onPressed: () {}, child: const Text('Aggiungi Locations'))
                : Row(
                    children: [
                      //Regina Quantity
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: ref.watch(reginaProdContr),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.numbers),
                              border: OutlineInputBorder(),
                              label: Text('Regina'),
                            ),
                          ),
                        ),
                      ),
                      //Tagliamento Quantity
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: ref.watch(tagliaProdContr),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.numbers),
                              border: OutlineInputBorder(),
                              label: Text('Tagliamento'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ), //TextFields Regular and Sale Price
            const ListTile(
              title: Text(
                'Prezzi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                //Regular Price
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: ref.watch(regPriceProdContr),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.euro),
                        border: OutlineInputBorder(),
                        label: Text('Regolare'),
                      ),
                    ),
                  ),
                ),
                //Sale Price
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: ref.watch(salePriceProdContr),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.euro),
                        border: OutlineInputBorder(),
                        label: Text('Scontato'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            //Prod Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.only(left: 8.0),
                  title: const Text(
                    'Descrizione',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    //TextField Descrizione
                    TextFormField(
                      maxLines: 8,
                      controller: ref.watch(descProdContr),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Descrizione',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Seo KeyWord
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.only(left: 8.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Seo KeyWord',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.grey.shade500,
                          ))
                    ],
                  ),
                  children: [
                    //TextField SEO KeyWord
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ref.watch(seoKWProdContr),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('Seo KeyWord'),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ActionChip(
                                  onPressed: () {
                                    ref.watch(seoKWProdContr).text ==
                                            ref.watch(nameProdContr).text
                                        ? null
                                        : ref
                                                .read(seoKWProdContr.notifier)
                                                .state
                                                .text =
                                            ref.watch(nameProdContr).text;
                                  },
                                  label: const Icon(Icons.copy)),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Brand
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.only(left: 8.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Brand',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.grey.shade500,
                          ))
                    ],
                  ),
                  children: [
                    //TextField Brang GLA
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ref.watch(brandProdContr),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Brand'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //EAN
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.only(left: 8.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'EAN',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.grey.shade500,
                          ))
                    ],
                  ),
                  children: [
                    //TextField EAN
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ref.watch(eanProdContr),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('EAN'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //GTIN
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.only(left: 8.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'GTIN',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.grey.shade500,
                          ))
                    ],
                  ),
                  children: [
                    //TextField GTIN
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ref.watch(gtinProdContr),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('GTIN'),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ActionChip(
                                  onPressed: () {
                                    ref.watch(gtinProdContr).text ==
                                            ref.watch(eanProdContr).text
                                        ? null
                                        : ref
                                                .read(gtinProdContr.notifier)
                                                .state
                                                .text =
                                            ref.watch(eanProdContr).text;
                                  },
                                  label: const Icon(Icons.copy)),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 80.0))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //IF DEVICE IS CONNECTED
          if (ref.watch(connectivityStatusProviders) ==
              ConnectivityStatus.isConnected) {
            if (ref.watch(nameProdContr).text.isEmpty ||
                ref.watch(descProdContr).text.isEmpty ||
                ref.watch(regPriceProdContr).text.isEmpty ||
                ref.watch(salePriceProdContr).text.isEmpty ||
                ref.watch(reginaProdContr).text.isEmpty ||
                ref.watch(tagliaProdContr).text.isEmpty ||
                ref.watch(seoKWProdContr).text.isEmpty ||
                ref.watch(brandProdContr).text.isEmpty ||
                ref.watch(eanProdContr).text.isEmpty ||
                ref.watch(gtinProdContr).text.isEmpty) {
              ref.watch(scaffoldMex)!
                ..removeCurrentSnackBar()
                ..showSnackBar(ref.watch(snackProvider.notifier).mySnackBar(
                    Colors.red.shade900,
                    Icons.block,
                    Colors.white,
                    'Compila tutti i campi!',
                    Colors.white));
            } else {
              ProductsModel prodMod = prod.copyWith(
                status: ref.watch(statusProd),
                name: ref.watch(nameProdContr).text,
                description: ref.watch(descProdContr).text,
                regularPrice: ref.watch(regPriceProdContr).text,
                salePrice: ref.watch(salePriceProdContr).text,
                categories: [
                  for (final categChecked in categTempChecked)
                    Category(
                        id: categChecked.id,
                        name: categChecked.name,
                        slug: categChecked.slug)
                ],
                locations: [
                  Locations(
                      id: prod.locations![0]!.id,
                      name: prod.locations![0]!.name,
                      slug: prod.locations![0]!.slug,
                      quantity: ref.watch(reginaProdContr).text),
                  Locations(
                      id: prod.locations![1]!.id,
                      name: prod.locations![1]!.name,
                      slug: prod.locations![1]!.slug,
                      quantity: ref.watch(tagliaProdContr).text),
                ],
                images: imageTempChecked.isEmpty
                    ? prod.images
                    : [
                        for (final imageTemp in imageTempChecked)
                          ImageProduct(
                              id: imageTemp.id,
                              src: imageTemp.sourceUrl,
                              name: '',
                              alt: '')
                      ],
                //ADD HERE METADATA CONDITIONS
              );
              ref.read(loadingProdBool.notifier).state = true;

              ref.watch(updateProd(prodMod).future).then((value) {
                ref.read(loadingProdBool.notifier).state = false;
                ref.read(prodProvider.notifier).restart(ref);
                Navigator.pop(context);
              });
            }
          }
          //IF DEVICE IS DISCONNECTED
          else {
            ref.watch(scaffoldMex)!
              ..removeCurrentSnackBar()
              ..showSnackBar(ref.watch(snackProvider.notifier).mySnackBar(
                  Colors.red.shade900,
                  Icons.wifi_off,
                  Colors.white,
                  'Problemi di connessione',
                  Colors.white));
          }
        },
        icon: ref.watch(loadingProdBool)
            ? const CircularProgressIndicator()
            : const Icon(Icons.check_circle),
        label: const Text('Aggiorna'),
      ),
    );
  }
}

class CustomModalBottom extends ConsumerWidget {
  const CustomModalBottom({
    super.key,
    this.prod,
  });

  final ProductsModel? prod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categTemp = ref.watch(categProvider);
    final categTempChecked = categTemp.where((e) => e.checked).toList();
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Lista Categorie',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: ref.watch(categoriesList).isEmpty
                ? null
                : categTempChecked.isEmpty
                    ? const SizedBox()
                    : SizedBox(
                        height: 20,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categTempChecked.length,
                            itemBuilder: (context, index) {
                              CategTemp categ = categTempChecked[index];
                              return Container(
                                  height: 10,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Text(
                                    index == categTempChecked.length - 1
                                        ? categ.name
                                        : '${categ.name}, ',
                                    style: const TextStyle(color: Colors.grey),
                                  ));
                            }),
                      ),
          ),
          const Divider(),
          Expanded(
            child: ref.watch(categFutureProvider).when(
                  skipLoadingOnReload: true,
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) =>
                      Center(child: Text('Errore: ${error.toString()}')),
                  data: (categories) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                CategoriesModel categ = categories[index];
                                return CheckboxListTile(
                                  value: categTemp[index].checked,
                                  // When tapping on the todo, change its completed status
                                  onChanged: (value) => ref
                                      .read(categProvider.notifier)
                                      .toggle(categ.id),
                                  title: Text(categ.name),
                                );
                              }),
                          ref.watch(categFutureProvider).isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ref.watch(noMoreCateg)
                                  ? const Text('Nessun altra Categoria')
                                  : ElevatedButton(
                                      onPressed: () {
                                        ref
                                            .watch(categProvider.notifier)
                                            .nextCalling(ref);
                                      },
                                      child: const Text('Altro')),
                        ],
                      ),
                    );
                  },
                ),
          )
        ],
      ),
    );
  }
}
