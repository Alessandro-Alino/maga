import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/prod_provider.dart';
import 'package:maga/models/categories_model.dart';

class CategsSelecter extends ConsumerWidget {
  const CategsSelecter(this.categs, {super.key});

  final List<CategoriesModel> categs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CategoriesModel> categParentList =
        categs.where((element) => element.parent == 0).toList();
    return AlertDialog(
        title: const Text('Categorie'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.90,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categParentList.length,
              itemBuilder: (context, index) {
                CategoriesModel categ = categParentList[index];
                List<CategoriesModel> categChildList = categs
                    .where((element) => element.parent == categ.id)
                    .toList();
                return categ.id == 15
                    ? ListTile(
                        onTap: () {
                          //Clear list product when change categ
                          ref.watch(prodProvider).clear();
                          ref.read(categID.notifier).state = categ.id;
                          ref.read(pageProdAPI.notifier).state = 1;
                          ref.read(noMoreProd.notifier).state = false;
                          Navigator.pop(context);
                        },
                        title: Text(categ.name),
                      )
                    : ExpansionTile(title: Text(categ.name), children: [
                        ...categChildList.map((e) {
                          List<CategoriesModel> categChildx2List = categs
                              .where((ele) => ele.parent == e.id)
                              .toList();
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ExpansionTile(
                              title: Text(e.name),
                              children: [
                                ...categChildx2List.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: ListTile(
                                      onTap: () {
                                        //Clear list product when change categ
                                        ref.watch(prodProvider).clear();
                                        ref.read(categID.notifier).state = e.id;
                                        ref.read(pageProdAPI.notifier).state =
                                            1;
                                        ref.read(noMoreProd.notifier).state =
                                            false;
                                        Navigator.pop(context);
                                      },
                                      title: Text(e.name),
                                    ),
                                  );
                                })
                              ],
                            ),
                          );
                        }),
                      ]);
              }),
        ));
  }
}
