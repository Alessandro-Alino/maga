import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/category/bloc/category_bloc.dart';

class CategoryInfoBox extends StatelessWidget {
  const CategoryInfoBox({
    super.key,
    required this.totalCateg,
    required this.pages,
    required this.currentPage,
    required this.categoryListLength,
  });

  final int totalCateg;
  final int pages;
  final int currentPage;
  final int categoryListLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Text(
              'Pagine: $currentPage/$pages - $categoryListLength/$totalCateg',
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
          // Reload
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              return Container(
                height: 32.0,
                width: 32.0,
                margin: const EdgeInsets.only(left: 8.0),
                child:
                    state.status == CategStatus.loading
                        ? CircleAvatar(
                          child: Center(
                            child: SizedBox(
                              width: 16.0,
                              height: 16.0,
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                        )
                        : IconButton.filled(
                          onPressed: () {
                            context.read<CategoryBloc>().getCategories();
                          },
                          iconSize: 16.0,
                          icon: Icon(Icons.refresh_outlined),
                        ),
              );
            },
          ),
        ],
      ),
    );
  }
}
