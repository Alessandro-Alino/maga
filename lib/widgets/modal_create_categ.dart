import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/media_provider.dart';
import 'package:maga/models/categories_model.dart';
import 'package:maga/screens/add_media.dart';
import 'package:maga/screens/home_maga.dart';

class ModalBottomCreateCateg extends ConsumerWidget {
  const ModalBottomCreateCateg({
    super.key,
    this.categ,
  });

  final CategoriesModel? categ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Label
          ListTile(
            title: const Text(
              'Crea nuova categoria',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 5.0),
                onPressed: () {
                  //Create new Categ
                  Map data = {
                    "name": ref.watch(nameCategContr).text,
                    "parent": ref.watch(categParentID),
                    "description": ref.watch(descCategContr).text,
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
                  ref.read(loadCateg.notifier).state = true;
                  debugPrint(data.toString());
                  ref.watch(creaCateg(data).future).then((value) {
                    //When Categ i Created
                    ref.read(loadCateg.notifier).state = false;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePageMaga()));
                  });
                },
                child: ref.watch(loadCateg)
                    ? const CircularProgressIndicator()
                    : const Text('CREA')),
          ),
          const Divider(
            indent: 100.0,
            endIndent: 100.0,
          ),

          //DropDown Parent Categ
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Categoria Genitore',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                  hint: const Text('Categoria Genitore'),
                  value: ref.watch(categParentID) == null
                      ? null
                      : categ == null
                          ? ref
                              .watch(categProvider)
                              .singleWhere(
                                  (e) => e.id == ref.watch(categParentID))
                              .name
                          : categ!.parent == 0
                              ? categ!.name
                              : ref
                                  .watch(categProvider)
                                  .singleWhere(
                                      (e) => e.id == ref.watch(categParentID))
                                  .name,
                  isExpanded: true,
                  items: [
                    ...ref.watch(categProvider).map((e) {
                      return DropdownMenuItem(
                        value: e.name,
                        onTap: () {
                          ref.read(categParentID.notifier).state = e.id;
                        },
                        child: Text(e.name),
                      );
                    })
                  ],
                  onChanged: (val) {}),
            );
          }),
          //Image Categ
          Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Center(
              child: Container(
                height: 180.0,
                width: 180.0,
                margin: const EdgeInsets.only(bottom: 16.0),
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
                        : categ == null
                            ? Center(
                                child: Card(
                                  elevation: 5.0,
                                  child: SizedBox(
                                    height: 150.0,
                                    width: 150.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                        width: 200.0,
                                        height: 200.0,
                                        imageUrl:
                                            'https://alealino.com/wp-content/uploads/woocommerce-placeholder.png',
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SizedBox(
                                          width: 100.0,
                                          height: 100.0,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
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
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                        width: 200.0,
                                        height: 200.0,
                                        imageUrl: categ!.image!.src.toString(),
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SizedBox(
                                          width: 100.0,
                                          height: 100.0,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                    //Mini FAB to Select image
                    Visibility(
                      visible: ref.watch(imagex).isEmpty,
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
                                        builder: (context) => const AddMedia()))
                                .then((value) {});
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                    //Icon to cancel imagex selected
                    Visibility(
                      visible: ref.watch(imagex).isNotEmpty,
                      child: Positioned(
                          child: FloatingActionButton(
                        heroTag: 'delImagex',
                        mini: true,
                        backgroundColor: Colors.red,
                        onPressed: () {
                          ref.watch(imagex).isEmpty
                              ? null
                              : ref
                                  .read(imageWPProvider.notifier)
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
            child: TextFormField(
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
  }
}
