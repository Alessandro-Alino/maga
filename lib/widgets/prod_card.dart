import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/controllers/media_provider.dart';
import 'package:maga/controllers/prod_provider.dart';
import 'package:maga/models/products_model.dart';
import 'package:maga/screens/add_or_mod.dart';

class ProdCard extends ConsumerWidget {
  const ProdCard({super.key, required this.prod});

  final ProductsModel prod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Locations?>? locations = prod.locations;
    return GestureDetector(
      onTap: () {
        //

        //
        ref.read(statusProd.notifier).state = prod.status;
        ref.read(nameProdContr.notifier).state.text = prod.name;
        ref.read(descProdContr.notifier).state.text =
            prod.description.replaceAll(RegExp('<[^>]*>'), '');
        ref.read(regPriceProdContr.notifier).state.text =
            prod.regularPrice.isEmpty ? '0' : prod.regularPrice;
        ref.read(salePriceProdContr.notifier).state.text =
            prod.salePrice.isEmpty ? '0' : prod.salePrice;
        //CheckBox active for every Categoy of the Prod
        for (final categ in prod.categories) {
          ref.read(categProvider.notifier).containsCheck(categ);
        }
        locations!.isEmpty
            ? null
            : ref.read(reginaProdContr.notifier).state.text =
                locations[0]!.quantity;
        locations.isEmpty
            ? null
            : ref.read(tagliaProdContr.notifier).state.text =
                locations[1]!.quantity;
        //GTIN
        if (prod.metaData.isEmpty) {
          null;
        } else {
          if (prod.metaData.where((e) => e.key == '_wc_gla_gtin').isEmpty) {
            ref.read(gtinProdContr.notifier).state.text = '';
            //Alert no GTIN
            ref.watch(scaffoldMex)!
              ..removeCurrentSnackBar()
              ..showSnackBar(ref.watch(snackProvider.notifier).mySnackBar(
                  Colors.amber.shade800,
                  Icons.error,
                  Colors.white,
                  'Valore mancante: GTIN',
                  Colors.white));
          } else {
            ref.read(gtinProdContr.notifier).state.text = prod.metaData
                .where((e) => e.key == '_wc_gla_gtin')
                .first
                .value
                .toString();
          }
        }
        //EAN
        if (prod.metaData.isEmpty) {
          null;
        } else {
          if (prod.metaData.where((e) => e.key == '_alg_ean').isEmpty) {
            ref.read(eanProdContr.notifier).state.text = '';
            //Alert no EAN
            ref.watch(scaffoldMex)!
              ..removeCurrentSnackBar()
              ..showSnackBar(ref.watch(snackProvider.notifier).mySnackBar(
                  Colors.amber.shade800,
                  Icons.error,
                  Colors.white,
                  'Valore mancante: EAN',
                  Colors.white));
          } else {
            ref.read(eanProdContr.notifier).state.text = prod.metaData
                .where((e) => e.key == '_alg_ean')
                .first
                .value
                .toString();
          }
        }
        //BRAND
        if (prod.metaData.isEmpty) {
          null;
        } else {
          if (prod.metaData.where((e) => e.key == '_wc_gla_brand').isEmpty) {
            ref.read(brandProdContr.notifier).state.text = '';
            //Alert no BRAND
            ref.watch(scaffoldMex)!
              ..removeCurrentSnackBar()
              ..showSnackBar(ref.watch(snackProvider.notifier).mySnackBar(
                  Colors.amber.shade800,
                  Icons.error,
                  Colors.white,
                  'Valore mancante: BRAND',
                  Colors.white));
          } else {
            ref.read(brandProdContr.notifier).state.text = prod.metaData
                .where((e) => e.key == '_wc_gla_brand')
                .first
                .value
                .toString();
          }
        }
        //SEO KeyWord
        if (prod.metaData.isEmpty) {
          null;
        } else {
          if (prod.metaData
              .where((e) => e.key == '_yoast_wpseo_focuskw')
              .isEmpty) {
            ref.read(seoKWProdContr.notifier).state.text = '';
            //Alert no SEO KeyWord
            ref.watch(scaffoldMex)!
              ..removeCurrentSnackBar()
              ..showSnackBar(ref.watch(snackProvider.notifier).mySnackBar(
                  Colors.amber.shade800,
                  Icons.error,
                  Colors.white,
                  'Valore mancante: SEO KeyWord',
                  Colors.white));
          } else {
            ref.read(seoKWProdContr.notifier).state.text = prod.metaData
                .where((e) => e.key == '_yoast_wpseo_focuskw')
                .first
                .value
                .toString();
          }
        }

        Navigator.push(context,
                MaterialPageRoute(builder: ((context) => AddOrMod(prod))))
            .then((value) {
          ref.watch(scaffoldMex)!.removeCurrentSnackBar();
          ref.read(statusProd.notifier).state = null;
          ref.read(nameProdContr.notifier).state.clear();
          ref.read(descProdContr.notifier).state.clear();
          ref.read(regPriceProdContr.notifier).state.clear();
          ref.read(salePriceProdContr.notifier).state.clear();
          ref.read(reginaProdContr.notifier).state.clear();
          ref.read(tagliaProdContr.notifier).state.clear();
          ref.read(eanProdContr.notifier).state.clear();
          ref.read(gtinProdContr.notifier).state.clear();
          ref.read(seoKWProdContr.notifier).state.clear();
          ref.read(brandProdContr.notifier).state.clear();
          //Categories List UnChecked
          ref.read(categProvider.notifier).allToggleFalse();
          //if Imagex Shoot or Selected, canceled from list
          ref.read(imageWPProvider.notifier).deselectImageTemp();
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Card(
                color: ref.watch(isLightMode)
                    ? Colors.indigo.shade100
                    : const Color.fromARGB(255, 56, 58, 91),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Image
                          Hero(
                            tag: prod.id,
                            child: Card(
                              elevation: 5.0,
                              child: SizedBox(
                                height: 100.0,
                                width: 100.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: CachedNetworkImage(
                                    width: 100.0,
                                    height: 100.0,
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
                          //Name, Categ,
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Name Prod
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    prod.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                                //Categories
                                Container(
                                  height: 20,
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: prod.categories.length,
                                      itemBuilder: (context, index) {
                                        Category categ = prod.categories[index];
                                        return Text(
                                          index == prod.categories.length - 1
                                              ? categ.name
                                              : '${categ.name}, ',
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 8.0,
                        endIndent: 8.0,
                      ),
                      prod.locations!.isEmpty
                          ? const Text('Sedi mancanti')
                          :
                          //Locations and Prices
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //Regina Stock
                                Flexible(
                                  child: Card(
                                    color: const Color.fromARGB(
                                        255, 247, 242, 249),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Regina',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                              prod.locations![0] == null
                                                  ? '0'
                                                  : prod.locations![0]!.quantity
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //Tagliam. Stock
                                Flexible(
                                  child: Card(
                                    color: const Color.fromARGB(
                                        255, 247, 242, 249),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Taglia',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                              prod.locations![1] == null
                                                  ? '0'
                                                  : prod.locations![1]!.quantity
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //Regular Price
                                Flexible(
                                  child: Card(
                                    color: Colors.red.shade900,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        prod.regularPrice.isEmpty
                                            ? '- €'
                                            : '${prod.regularPrice} €',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                //Sales Price
                                Flexible(
                                  child: Card(
                                    color: Colors.green.shade900,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        prod.salePrice.isEmpty
                                            ? '- €'
                                            : '${prod.salePrice} €',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
              //Badge if Prod is DRAFT
              prod.status != 'publish'
                  ? Positioned(
                      right: 20.0,
                      top: 20.0,
                      child: Container(
                        width: 80.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blueGrey,
                        ),
                        child: const Center(
                            child: Text(
                          'BOZZA',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
