import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/media_provider.dart';
import 'package:maga/models/categories_model.dart';
import 'package:maga/widgets/modal_create_categ.dart';

class ManagerCateg extends ConsumerWidget {
  const ManagerCateg({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestione Categorie'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: RefreshIndicator(
          onRefresh: () {
            Future future =
                Future(() => ref.watch(categProvider.notifier).restart(ref));
            return ref.watch(categFutureProvider).isLoading
                ? Future(() {})
                : future;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ref.watch(categoriesList).length,
                    itemBuilder: (context, index) {
                      CategoriesModel categ = ref.watch(categoriesList)[index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            //set Name Categ
                            ref.read(nameCategContr.notifier).state.text =
                                categ.name;
                            //set Desc Categ
                            ref.read(descCategContr.notifier).state.text =
                                categ.description;
                            //set Parent categ
                            ref.read(categParentID.notifier).state =
                                categ.parent;
                            //image
                            showModalBottomSheet(
                                isScrollControlled: true,
                                isDismissible:
                                    ref.read(loadCateg) ? false : true,
                                context: context,
                                builder: (context) {
                                  return ModalBottomCreateCateg(
                                    categ: categ,
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
                          title: Text(categ.name),
                        ),
                      );
                    }),
                ref.watch(categFutureProvider).isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ref.watch(noMoreCateg)
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Nessun altra Categoria'),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ActionChip(
                                onPressed: () {
                                  ref
                                      .watch(categProvider.notifier)
                                      .nextCalling(ref);
                                },
                                label: const Text('Altro')),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
