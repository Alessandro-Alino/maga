import 'package:dio/dio.dart';
import 'package:maga/config/client/woo_api.dart';

class ImageRepo {
  WooAPI api = WooAPI.instance;

  // Fetch all Images
  Future<Response<dynamic>> getImages({
    required int page,
    required perPage,
  }) async {
    final response = await api.get(
      '/wp-json/wp/v2/media',
      queryParameters: {
        'page': page,
        'per_page': perPage,
        'media_type': 'image',
      },
    );
    return response;
  }

  // Fetch ONE Images
  Future<Response<dynamic>> getOneImage({required int id}) async {
    final response = await api.get('/wp-json/wp/v2/media/$id');
    return response;
  }

  // Post Image
  Future<Response<dynamic>> postImages({required int page}) async {
    final response = await api.post(
      '/wp-json/wp/v2/media',
      2,
      queryParameters: {'page': page},
    );
    //log('REPO: $response');
    return response;
  }
}
