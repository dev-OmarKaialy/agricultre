import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../shared/shared_preferences_service.dart';
import 'handling_exception_request.dart';

typedef FromJson<T> = T Function(String body);

class PatchApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final Map body;
  final FromJson fromJson;
  final bool isLogin;
  final Duration timeout;

  const PatchApi({
    required this.uri,
    required this.body,
    required this.fromJson,
    this.isLogin = false,
    this.timeout = const Duration(seconds: 20),
  });

  Future<T> callRequest() async {
    // log('the token in the request header is $token'.logWhite, name: 'request manager ==> post function ');
    try {
      final token = SharedPreferencesService.getToken();

      if (token != null) log(token, name: 'user Token');
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) "Authorization": 'Bearer $token'
      };

      var request = http.Request('PATCH', uri);
      request.body = jsonEncode(body);
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(timeout);
      log(request.body, name: "request body");
      http.Response response = await http.Response.fromStream(streamedResponse);
      log(response.statusCode.toString(), name: "request status");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on HttpException {
      log(
        'http exception',
        name: 'RequestManager post function',
      );
      rethrow;
    } on FormatException {
      log(
        'something went wrong in parsing the uri',
        name: 'RequestManager post function',
      );
      rethrow;
    } on SocketException {
      log(
        'socket exception',
        name: 'RequestManager post function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString(),
        name: 'RequestManager post function',
      );
      rethrow;
    }
  }
}
