import 'package:flutter/material.dart';
import 'package:maga/config/router/auto_route.dart';
import 'package:maga/config/provider/app_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple.shade900,
          ),
        ),
        title: 'Flutter App Maga',
      ),
    );
  }
}
