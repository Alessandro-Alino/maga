import 'package:dio/dio.dart';
import 'package:maga/config/client/woo_exeption.dart';
import 'package:maga/config/client/woo_interceptor.dart';

class WooAPI {
  final Dio _dio = Dio();

  static WooAPI? _instance;

  WooAPI._();

  static Future<WooAPI> initialize() async {
    if (_instance == null) {
      _instance = WooAPI._();
      await _instance!._initialize();
    }
    return _instance!;
  }

  static WooAPI get instance {
    if (_instance == null) {
      initialize();
    }
    return _instance!;
  }

  Future<void> _initialize() async {
    const baseUrl = String.fromEnvironment('baseUrl');

    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.interceptors.add(WooInterceptor());
  }

  // Generic GET
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw WooException.fromDioError(e);
    }
  }

  // Generic POST
  Future<Response> post(
    String endpoint,
    dynamic data, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw WooException.fromDioError(e);
    }
  }

  // Generic PUT
  Future<Response> put(
    String endpoint,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw WooException.fromDioError(e);
    }
  }

  // Generic DELETE
  Future<Response> delete(String endpoint) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: {'force': true},
      );
      return response;
    } on DioException catch (e) {
      throw WooException.fromDioError(e);
    }
  }
}
