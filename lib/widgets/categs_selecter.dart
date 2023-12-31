import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/gen_provider.dart';
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
            child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ListView.builder(
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
                        : GestureDetector(
                            onLongPress: () {
                              //Clear list product when change categ
                              ref.watch(prodProvider).clear();
                              ref.read(categID.notifier).state = categ.id;
                              ref.read(pageProdAPI.notifier).state = 1;
                              ref.read(noMoreProd.notifier).state = false;
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ExpansionTile(
                                  key: Key(ref
                                      .watch(categParentExpansion)
                                      .toString()),
                                  initiallyExpanded:
                                      ref.watch(categParentExpansion) == index,
                                  onExpansionChanged: (value) {
                                    if (value) {
                                      ref
                                          .read(categParentExpansion.notifier)
                                          .state = index;
                                    } else {
                                      ref
                                          .read(categParentExpansion.notifier)
                                          .state = -1;
                                    }
                                  },
                                  backgroundColor: ref.watch(isLightMode)
                                      ? Colors.indigo.shade100
                                      : Colors.indigo.shade700,
                                  collapsedBackgroundColor:
                                      ref.watch(isLightMode)
                                          ? Colors.indigo.shade100
                                          : Colors.indigo.shade700,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  collapsedShape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  title: Text(
                                    categ.name,
                                  ),
                                  children: [
                                    ...categChildList.map((e) {
                                      List<CategoriesModel> categChildx2List =
                                          categs
                                              .where(
                                                  (ele) => ele.parent == e.id)
                                              .toList();
                                      return Container(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        margin: const EdgeInsets.all(4.0),
                                        child: GestureDetector(
                                          onLongPress: () {
                                            //Clear list product when change categ
                                            ref.watch(prodProvider).clear();
                                            ref.read(categID.notifier).state =
                                                e.id;
                                            ref
                                                .read(pageProdAPI.notifier)
                                                .state = 1;
                                            ref
                                                .read(noMoreProd.notifier)
                                                .state = false;
                                            Navigator.pop(context);
                                          },
                                          child: ExpansionTile(
                                            backgroundColor:
                                                ref.watch(isLightMode)
                                                    ? Colors.indigo.shade200
                                                    : Colors.indigo.shade900,
                                            collapsedBackgroundColor:
                                                ref.watch(isLightMode)
                                                    ? Colors.indigo.shade200
                                                    : Colors.indigo.shade900,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            collapsedShape:
                                                const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0))),
                                            title: Text(e.name),
                                            children: [
                                              ...categChildx2List.map((e) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: ListTile(
                                                    onTap: () {
                                                      //Clear list product when change categ
                                                      ref
                                                          .watch(prodProvider)
                                                          .clear();
                                                      ref
                                                          .read(
                                                              categID.notifier)
                                                          .state = e.id;
                                                      ref
                                                          .read(pageProdAPI
                                                              .notifier)
                                                          .state = 1;
                                                      ref
                                                          .read(noMoreProd
                                                              .notifier)
                                                          .state = false;
                                                      Navigator.pop(context);
                                                    },
                                                    title: Text(e.name),
                                                  ),
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ]),
                            ),
                          );
                  });
            })));
  }
}
