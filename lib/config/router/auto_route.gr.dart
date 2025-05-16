// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:maga/feature/category/model/category.dart' as _i6;
import 'package:maga/feature/category/screen/manage_category.dart' as _i3;
import 'package:maga/feature/image/screen/image_page.dart' as _i2;
import 'package:maga/screen/home.dart' as _i1;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.ImagePage]
class ImageRoute extends _i4.PageRouteInfo<ImageRouteArgs> {
  ImageRoute({_i5.Key? key, int? id, List<_i4.PageRouteInfo>? children})
    : super(
        ImageRoute.name,
        args: ImageRouteArgs(key: key, id: id),
        rawPathParams: {'id': id},
        initialChildren: children,
      );

  static const String name = 'ImageRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ImageRouteArgs>(
        orElse: () => ImageRouteArgs(id: pathParams.optInt('id')),
      );
      return _i2.ImagePage(key: args.key, id: args.id);
    },
  );
}

class ImageRouteArgs {
  const ImageRouteArgs({this.key, this.id});

  final _i5.Key? key;

  final int? id;

  @override
  String toString() {
    return 'ImageRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.ManageCategoryPage]
class ManageCategoryRoute extends _i4.PageRouteInfo<ManageCategoryRouteArgs> {
  ManageCategoryRoute({
    _i5.Key? key,
    int? id,
    _i6.CategModel? categ,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         ManageCategoryRoute.name,
         args: ManageCategoryRouteArgs(key: key, id: id, categ: categ),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'ManageCategoryRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ManageCategoryRouteArgs>(
        orElse: () => ManageCategoryRouteArgs(id: pathParams.optInt('id')),
      );
      return _i3.ManageCategoryPage(
        key: args.key,
        id: args.id,
        categ: args.categ,
      );
    },
  );
}

class ManageCategoryRouteArgs {
  const ManageCategoryRouteArgs({this.key, this.id, this.categ});

  final _i5.Key? key;

  final int? id;

  final _i6.CategModel? categ;

  @override
  String toString() {
    return 'ManageCategoryRouteArgs{key: $key, id: $id, categ: $categ}';
  }
}
