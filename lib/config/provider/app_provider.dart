import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/category/bloc/category_bloc.dart';
import 'package:maga/feature/category/repo/category_repo.dart';
import 'package:maga/feature/image/bloc/image_bloc.dart';
import 'package:maga/feature/image/repo/image_repo.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // Image Repo
        RepositoryProvider<ImageRepo>(create: (context) => ImageRepo()),
        // Category Repo
        RepositoryProvider<CategoryRepo>(create: (context) => CategoryRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          // Image Bloc
          BlocProvider<ImageBloc>(
            create:
                (context) => ImageBloc(context.read<ImageRepo>())..getImages(),
          ),
          // Category Bloc
          BlocProvider<CategoryBloc>(
            create:
                (context) =>
                    CategoryBloc(context.read<CategoryRepo>())..getCategories(),
          ),
        ],
        child: child,
      ),
    );
  }
}
