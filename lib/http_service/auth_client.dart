import 'dart:convert';

import 'package:chef_bites/config/encode_decode.dart';
import "package:http/http.dart" as http;

class AuthClient {
  static final AuthClient instence = AuthClient._internal();
  EncodeDecode encodeDecode = EncodeDecode();
  factory AuthClient() {
    return instence;
  }
  AuthClient._internal();
  doGet(String url, Map<String, String> header) {
    return http.get(Uri.parse(url), headers: header);
  }

  Future<http.Response> doPost(String url, Map<String, String> body,
      {Map<String, String>? header}) {
    Map<String, String> head = {"context-type": "application/json"};
    if (header != null) {
      head.addAll(header);
    }
    String data = encodeDecode.encode(json.encode(body));
    return http.post(Uri.parse(url),
    body: jsonEncode({"info":data}),headers: header);
  }
}
