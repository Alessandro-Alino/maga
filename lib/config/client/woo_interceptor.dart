import 'dart:convert';
import 'package:dio/dio.dart';

class WooInterceptor extends InterceptorsWrapper {
  WooInterceptor({super.onRequest, super.onResponse, super.onError});

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    const cK = String.fromEnvironment('consumer_key');
    const cS = String.fromEnvironment('consumer_secret');
    const mediaPsw = String.fromEnvironment('media_psw');
    const user = String.fromEnvironment('user');
    // Add Custom pathParam (for Media)
    if (options.path.contains('/wp-json/wp/v2/media')) {
      final String userAndAppPsw = base64.encode(
        utf8.encode('$user:$mediaPsw'),
      );
      options.headers['Authorization'] = 'Basic $userAndAppPsw';
    }
    // Add Basic Headers
    else {
      final String token = base64.encode(utf8.encode('$cK:$cS'));
      options.headers['Authorization'] = 'Basic $token';
    }
    return handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }
}
