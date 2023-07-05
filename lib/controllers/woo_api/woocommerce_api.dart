import "dart:collection";
import 'dart:convert';
import 'dart:io';
import "dart:math";
import "dart:core";
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maga/controllers/woo_api/woocommerce_error.dart';

/// [url] is you're site's base URL, e.g. `https://www.yourdomain.com`
///
/// [consumerKey] is the consumer key provided by WooCommerce, e.g. `ck_1a2b3c4d5e6f7g8h9i`
///
/// [consumerSecret] is the consumer secret provided by WooCommerce, e.g. `cs_1a2b3c4d5e6f7g8h9i`
///
/// [isHttps] check if [url] is https based
class WooCommerceAPI {
  String url;
  String consumerKey;
  String consumerSecret;
  bool? isHttps;

  WooCommerceAPI(
      {required this.url,
      required this.consumerKey,
      required this.consumerSecret,
      context}) {
    url = url;
    consumerKey = consumerKey;
    consumerSecret = consumerSecret;

    if (url.startsWith("https")) {
      isHttps = true;
    } else {
      isHttps = false;
    }
  }

  /// Generate a valid OAuth 1.0 URL
  ///
  /// if [isHttps] is true we just return the URL with
  /// [consumerKey] and [consumerSecret] as query parameters
  String _getOAuthURL(String requestMethod, String endpoint) {
    String consumerKey = this.consumerKey;
    String consumerSecret = this.consumerSecret;

    String token = "";
    String url = "${this.url}$endpoint";
    bool containsQueryParams = url.contains("?");

    if (isHttps == true) {
      return url +
          (containsQueryParams == true
              ? "&consumer_key=${this.consumerKey}&consumer_secret=${this.consumerSecret}"
              : "?consumer_key=${this.consumerKey}&consumer_secret=${this.consumerSecret}");
    }

    Random rand = Random();
    List<int> codeUnits = List.generate(10, (index) {
      return rand.nextInt(26) + 97;
    });

    /// Random string uniquely generated to identify each signed request
    String nonce = String.fromCharCodes(codeUnits);

    /// The timestamp allows the Service Provider to only keep nonce values for a limited time
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    String parameters =
        "oauth_consumer_key=$consumerKey&oauth_nonce=$nonce&oauth_signature_method=HMAC-SHA1&oauth_timestamp=$timestamp&oauth_token=$token&oauth_version=1.0&";

    if (containsQueryParams == true) {
      parameters = parameters + url.split("?")[1];
    } else {
      parameters = parameters.substring(0, parameters.length - 1);
    }

    Map<dynamic, dynamic> params = QueryString.parse(parameters);
    Map<dynamic, dynamic> treeMap = SplayTreeMap<dynamic, dynamic>();
    treeMap.addAll(params);

    String parameterString = "";

    for (var key in treeMap.keys) {
      parameterString =
          // ignore: prefer_interpolation_to_compose_strings
          "${"$parameterString${Uri.encodeQueryComponent(key)}=" + treeMap[key]}&";
    }

    parameterString = parameterString.substring(0, parameterString.length - 1);

    String method = requestMethod;
    String baseString =
        "$method&${Uri.encodeQueryComponent(containsQueryParams == true ? url.split("?")[0] : url)}&${Uri.encodeQueryComponent(parameterString)}";

    String signingKey = "$consumerSecret&$token";
    crypto.Hmac hmacSha1 =
        crypto.Hmac(crypto.sha1, utf8.encode(signingKey)); // HMAC-SHA1

    /// The Signature is used by the server to verify the
    /// authenticity of the request and prevent unauthorized access.
    /// Here we use HMAC-SHA1 method.
    crypto.Digest signature = hmacSha1.convert(utf8.encode(baseString));

    String finalSignature = base64Encode(signature.bytes);

    String requestUrl = "";

    if (containsQueryParams == true) {
      requestUrl =
          "${url.split("?")[0]}?$parameterString&oauth_signature=${Uri.encodeQueryComponent(finalSignature)}";
    } else {
      requestUrl =
          "$url?$parameterString&oauth_signature=${Uri.encodeQueryComponent(finalSignature)}";
    }

    return requestUrl;
  }

  /// Handle network errors if [response.statusCode] is not 200 (OK).
  ///
  /// WooCommerce supports and give informations about errors 400, 401, 404 and 500
  Exception _handleError(http.Response response) {
    switch (response.statusCode) {
      case 400:
      case 401:
      case 404:
      case 500:
        throw Exception(
            WooCommerceError.fromJson(json.decode(response.body)).toString());
      default:
        throw Exception(
            "An error occurred, status code: ${response.statusCode}");
    }
  }

  Future<dynamic> getAsyncMedia(String endPoint) async {
    String url = _getOAuthURL("GET", endPoint);

    try {
      final http.Response response = await http.get(Uri.parse(url), headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('fabio:fOiB tzyy 2f7S GttH qEZQ WfZ1'))}'
      });

      if (response.statusCode == 200) {
        var x = response.headers['x-wp-totalpages'];
        debugPrint(x.toString());
        return [jsonDecode(response.body), x];
      }
      _handleError(response);
    } on SocketException {
      throw Exception('No Internet connection.');
    }
  }

  Future<dynamic> getAsync(String endPoint) async {
    String url = _getOAuthURL("GET", endPoint);

    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      _handleError(response);
    } on SocketException {
      throw Exception('No Internet connection.');
    }
  }

  Future<dynamic> postAsyncMedia(String endPoint, File data) async {
    String url = _getOAuthURL("POST", endPoint);
    http.Client client = http.Client();
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.headers[HttpHeaders.authorizationHeader] =
        'Basic ${base64Encode(utf8.encode('fabio:fOiB tzyy 2f7S GttH qEZQ WfZ1'))}';
    //ale:3nz1 HSup St5r lo3Y FPwG yy1N
    request.files.add(await http.MultipartFile.fromPath('file', data.path,
        filename: data.path.split('/').last));
    var response = await client.send(request);
    if (response.statusCode == 201) {
      final respStr = await response.stream.bytesToString();
      debugPrint(respStr);
      return json.decode(respStr)['source_url'];
    } else {
      final respStr = await response.stream.bytesToString();
      debugPrint(respStr);

      return null;
    }
  }

  Future<dynamic> postAsync(String endPoint, Map data) async {
    String url = _getOAuthURL("POST", endPoint);

    http.Client client = http.Client();
    http.Request request = http.Request('POST', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    return dataResponse;
  }

  Future<dynamic> deleteAsyncMedia(
    String endPoint,
  ) async {
    String url = _getOAuthURL("DELETE", endPoint);

    http.Client client = http.Client();

    http.Request request = http.Request('DELETE', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.headers[HttpHeaders.authorizationHeader] =
        'Basic ${base64Encode(utf8.encode('ale:3nz1 HSup St5r lo3Y FPwG yy1N'))}';
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    debugPrint(dataResponse.toString());
    return dataResponse;
  }

  Future<dynamic> deleteAsync(
    String endPoint,
  ) async {
    String url = _getOAuthURL("DELETE", endPoint);

    http.Client client = http.Client();
    http.Request request = http.Request('DELETE', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    debugPrint(dataResponse.toString());
    return dataResponse;
  }
}

class QueryString {
  /// Parses the given query string into a Map.
  static Map parse(String query) {
    RegExp search = RegExp('([^&=]+)=?([^&]*)');
    Map result = {};

    // Get rid off the beginning ? in query strings.
    if (query.startsWith('?')) query = query.substring(1);

    // A custom decoder.
    decode(String s) => Uri.decodeComponent(s.replaceAll('+', ' '));

    // Go through all the matches and build the result map.
    for (Match match in search.allMatches(query)) {
      result[decode(match.group(1) ?? "")] = decode(match.group(2) ?? "");
    }

    return result;
  }
}
