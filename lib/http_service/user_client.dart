import 'dart:convert';
import 'package:chef_bites/config/encode_decode.dart';
import 'package:chef_bites/utils/cb_exception.dart';
import 'package:http/http.dart' as http;

class UserClient {
  static final UserClient instance = UserClient._internal();
  EncodeDecode encodeDecode = EncodeDecode();
  factory UserClient() {
    return instance;
  }

  UserClient._internal();

  Future<http.Response> doGet(String url, {Map<String, String>? header}) async {
    Map<String, String> head = {
      "context-text": "application/json",
      "Authorization": "Bearer {}"
    };
    if (header != null) {
      head.addAll(header);
    }
    try {
      http.Response response = await http.get(Uri.parse(url), headers: header);
      print(response.body);
      dynamic jsonData = jsonDecode(response.body);
      if (response.statusCode != 403 && response.statusCode != 401) {
        return response;
      } else {
        throw UnAuthorizedException(
          message: jsonData['message'] ?? "session Expired..!".toString(),
          statusCode: response.statusCode,
        );
      }
    } on UnAuthorizedException catch (e) {
      return http.Response('{"message":"${e.message}"}', e.statusCode);
    }
  }

  Future<http.Response> doPost(String url, Map<String, dynamic> body,
      {Map<String, String>? header}) async {
    Map<String, String> head = {
      "context-text": "application/json",
      "Authorization": "bearer"
    };
    if (header != null) {
      head.addAll(header);
    }
    dynamic data = jsonEncode(
      {
        "info": encodeDecode.encode(
          json.encode(body),
        ),
      },
    );
    try {
      http.Response response = await http.post(Uri.parse(url),
          body: jsonEncode(
            {
              "info": encodeDecode.encode(
                json.encode(body),
              ),
            },
          ),
          headers: header);
      dynamic jsonData = jsonDecode(response.body);
      if (response.statusCode != 403 && response.statusCode != 401) {
        return response;
      } else {
        throw UnAuthorizedException(
            message: jsonData['message'] ?? "Session Expired..!".toString(),
            statusCode: response.statusCode);
      }
    } on UnAuthorizedException catch (e) {
      return http.Response('{"message":"${e.message}"}', e.statusCode);
    }
  }
}
