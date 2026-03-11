import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_flutter/utility/api_endpoints.dart';

class HttpHelper {
  static String token = "";

  Future<Response> getRequest({required String path, required Map<String, String>? queryParameters}) async {
    Uri url = Uri(
      scheme: ApiEndpoints.scheme,
      host: ApiEndpoints.host,
      port: ApiEndpoints.port,
      path: '${ApiEndpoints.basePath}$path',
      queryParameters: queryParameters,
    );

    debugPrint(url.toString());

    final Response response = await get(url, headers: {'Accept': 'application/json', 'Authorization': token});

    return response;
  }
}
