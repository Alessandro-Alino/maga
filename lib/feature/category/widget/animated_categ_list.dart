import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/category/bloc/category_bloc.dart';
import 'package:maga/feature/category/model/category.dart';
import 'package:maga/feature/category/widget/card_categ.dart';

// Animated Categ List
class AnimatedCategoryList extends StatelessWidget {
  const AnimatedCategoryList({super.key, required this.categoryList});

  final List<CategModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: context.read<CategoryBloc>().listKey,
        initialItemCount: categoryList.length,
        itemBuilder: (context, index, animation) {
          // Categ
          CategModel categ = categoryList[index];
          // Parent Categ
          String parent =
              categ.parent == 0
                  ? 'Categoria Genitore'
                  : categoryList.singleWhere((e) => e.id == categ.parent).name;
          return SlideTransition(
            position: animation.drive(
              Tween(
                begin: const Offset(-10, 0),
                end: const Offset(0, 0),
              ).chain(CurveTween(curve: Curves.easeInOut)),
            ),
            child: CardCateg(categ: categ, subtitle: parent),
          );
        },
      ),
    );
  }
}

// Filtered (non-animated) Categ List
class FilteredCategoryList extends StatelessWidget {
  const FilteredCategoryList({super.key, required this.categoryList});

  final List<CategModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          // Categ
          CategModel categ = categoryList[index];
          // Parent Categ
          String parent =
              categ.parent == 0
                  ? 'Categoria Genitore'
                  : context
                      .read<CategoryBloc>()
                      .state
                      .fetchedCategoriesList
                      .singleWhere((e) => e.id == categ.parent)
                      .name;
          return CardCateg(categ: categ, subtitle: parent);
        },
      ),
    );
  }
}
