import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maga/config/router/auto_route.gr.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Row(children: [CircleAvatar()])),
          // Category Page
          ListTile(
            leading: Icon(Icons.add_circle_outline_sharp),
            title: const Text('Crea Categoria'),
            onTap: () {
              context.router.popAndPush(ManageCategoryRoute());
            },
          ),
          // Image Page
          ListTile(
            leading: Icon(Icons.image_outlined),
            title: const Text('Immagini'),
            onTap: () {
              context.router.popAndPush(ImageRoute());
            },
          ),
        ],
      ),
    );
  }
}
