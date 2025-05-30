import 'package:dio/dio.dart';
import 'package:maga/config/client/woo_api.dart';

class CategoryRepo {
  WooAPI api = WooAPI.instance;

  // Fetch all Categories
  Future<Response> getCategories({
    required int page,
    required int perPage,
  }) async {
    final response = await api.get(
      '/wp-json/wc/v3/products/categories',
      queryParameters: {'page': page, 'per_page': perPage},
    );
    return response;
  }

  // Create Category
  Future<Response> createCategories(Map<String, dynamic> category) async {
    final dynamic response = await api.post(
      '/wp-json/wc/v3/products/categories/',
      category,
    );
    return response;
  }

  // Update Category
  Future<dynamic> updateCategories(
    int id,
    Map<String, dynamic> category,
  ) async {
    final response = await api.put(
      '/wp-json/wc/v3/products/categories/$id',
      category,
    );
    return response;
  }

  // Delete Category
  Future<dynamic> deleteCategories(int id) async {
    final response = await api.delete('/wp-json/wc/v3/products/categories/$id');
    return response;
  }
}
