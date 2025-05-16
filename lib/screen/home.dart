import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maga/feature/category/widget/categ_list.dart';
import 'package:maga/widget/app_drawer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Magazzino')),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1400.0),
          child: Row(
            children: [
              Flexible(flex: 1, child: CategoryList()),
              Flexible(flex: 2, child: Container(color: Colors.yellow)),
            ],
          ),
        ),
      ),
    );
  }
}
