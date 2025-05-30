import 'package:dio/dio.dart';
import 'package:maga/config/client/woo_api.dart';

class ImageRepo {
  WooAPI api = WooAPI.instance;

  // Fetch all Images
  Future<Response> getImages({required int page, required perPage}) async {
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
  Future<Response> getOneImage({required int id}) async {
    final response = await api.get('/wp-json/wp/v2/media/$id');
    return response;
  }

  // Post Image
  Future<Response> uploadImages({
    required List<int> imageBytes,
    required String filename,
  }) async {
    final response = await api.post(
      '/wp-json/wp/v2/media',
      imageBytes,
      options: Options(
        headers: {
          'Content-Type': 'image/jpeg',
          'Content-Disposition': 'attachment; filename="$filename"',
        },
      ),
    );
    return response;
  }
}
