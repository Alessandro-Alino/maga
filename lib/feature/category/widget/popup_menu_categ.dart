import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/config/router/auto_route.gr.dart';
import 'package:maga/feature/category/bloc/category_bloc.dart';
import 'package:maga/feature/category/model/category.dart';
import 'package:maga/widget/app_dialog.dart';
import 'package:maga/widget/app_snackbar.dart';

class PopupMenuCategory extends StatelessWidget {
  const PopupMenuCategory({super.key, required this.category});

  final CategModel category;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state.manageStatus == ManageCategStatus.error) {
          context.appSnackBar(
            isError: true,
            icon: Icons.error,
            child: Text('${state.errorMessage}'),
          );
        }
      },
      child: PopupMenuButton(
        clipBehavior: Clip.hardEdge,
        menuPadding: EdgeInsets.zero,
        padding: EdgeInsets.all(0.0),
        offset: Offset(40.0, 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        elevation: 5.0,
        itemBuilder: (context) {
          return [
            // Edit category
            PopupMenuItem(
              onTap: () {
                context.router.push(
                  ManageCategoryRoute(id: category.id, categ: category),
                );
              },
              padding: EdgeInsets.zero,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                tileColor: Colors.blue.withValues(alpha: 0.1),
                leading: Icon(Icons.edit, color: Colors.blueAccent),
                title: Text(
                  'Modifica',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            // Delete Category
            PopupMenuItem(
              onTap: () {
                // Show Dialog
                showDialog(
                  context: context,
                  builder:
                      (_) => AppDialog(
                        title: 'Eliminare la Categoria?',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Categoria selezionata: ${category.name}'),
                            Text('Vuoi eliminare questa Categoria?'),
                          ],
                        ),
                        onConfirm: () {
                          context.read<CategoryBloc>().deleteCategory(
                            category: category,
                          );
                          if (context.mounted) {
                            context.router.pop();
                          }
                        },
                      ),
                );
              },
              padding: EdgeInsets.zero,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                tileColor: Colors.red.withValues(alpha: 0.1),
                leading: Icon(Icons.delete, color: Colors.red),
                title: const Text(
                  'Elimina',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
          ];
        },
      ),
    );
  }
}
