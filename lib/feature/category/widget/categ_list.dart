import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/category/bloc/category_bloc.dart';
import 'package:maga/feature/category/widget/animated_categ_list.dart';
import 'package:maga/widget/info_box.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final TextEditingController _filterCntrl = TextEditingController();

  @override
  void dispose() {
    _filterCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Clear Filter
    clearFilterInputText() {
      context.read<CategoryBloc>().filterCategories(inputText: '');
      _filterCntrl.clear();
    }

    return BlocListener<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state.status == CategStatus.loading) {
          clearFilterInputText();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return Column(
              children: [
                // Search in Category List
                SearchBar(
                  controller: _filterCntrl,
                  hintText: 'Cerca',
                  elevation: WidgetStateProperty.resolveWith((e)=>2.0),
                  onChanged: (e) {
                    context.read<CategoryBloc>().filterCategories(
                      inputText: _filterCntrl.text,
                    );
                  },
                  trailing: [
                    Visibility(
                      visible: _filterCntrl.text.isNotEmpty,
                      child: IconButton(
                        onPressed: () {
                          clearFilterInputText();
                        },
                        icon: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                // InfoBox
                InfoBox(
                  pages: state.pages,
                  total: state.totalCateg,
                  currentPage: state.currentPage,
                  listLength: state.animatedCategoriesList.length,
                  status: state.status == CategStatus.loading,
                  onPressed: () {
                    context.read<CategoryBloc>().getCategories();
                  },
                ),
                // Categories List
                _filterCntrl.text.isNotEmpty
                    ? FilteredCategoryList(
                      categoryList: state.filterCategoriesList,
                    )
                    : AnimatedCategoryList(
                      categoryList: state.animatedCategoriesList,
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
