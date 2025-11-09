import 'dart:io';

import 'package:get/get.dart';
import '../errors/exceptions.dart';
import '../utils/logger.dart';
import 'connectivity_service.dart';

class AppGetConnect extends GetConnect {
  final ConnectivityService connectivity;

  AppGetConnect(this.connectivity);

  @override
  void onInit() {
    httpClient.baseUrl = const String.fromEnvironment('BASE_URL', defaultValue: 'https://jsonplaceholder.typicode.com');
    httpClient.timeout = const Duration(seconds: 15);
    httpClient.maxAuthRetries = 1;

    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      return request;
    });

    httpClient.addResponseModifier<dynamic>((request, response) {
      AppLogger.d('↩ ${response.statusCode} ${request.url}');
      if (response.statusCode != null && response.statusCode! >= 400) {
        throw ServerException(code: response.statusCode, message: response.statusText);
      }
      return response;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      // Add token refresh flow if needed
      return request;
    });

    super.onInit();
  }

  Future<Response<T>> safeGet<T>(String url, {Map<String, dynamic>? query}) async {
    if (!connectivity.isOnline) throw NoInternetException();
    try {
      return await get<T>(url, query: query);
    } on HttpException catch (e) {
      if (e.message.contains('timed out')) throw TimeoutExceptionEx(message: e.message);
      rethrow;
    }
  }

  Future<Response<T>> safePost<T>(String url, dynamic body) async {
    if (!connectivity.isOnline) throw NoInternetException();
    try {
      return await post<T>(url, body);
    } on HttpException catch (e) {
      if (e.message.contains('timed out')) throw TimeoutExceptionEx(message: e.message);
      rethrow;
    }
  }
}