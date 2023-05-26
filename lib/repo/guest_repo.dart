import 'dart:convert';

import 'package:chef_bites/config/constant.dart';
import 'package:chef_bites/config/encode_decode.dart';
import 'package:chef_bites/model/guest_model.dart';
import 'package:http/http.dart' as http;

abstract class GuestRepo {
  Future<List<GuestModel>> getGuestData();
}

class GuestImpl extends GuestRepo {
  EncodeDecode encodeDecode = EncodeDecode();
  
  @override
  Future<List<GuestModel>> getGuestData() async {
    String url = ApiConstant.GUEST;
    http.Response response = await http
        .get(Uri.parse(url), headers: {"contant-type": "application/json"});
    Map<String, dynamic> jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonData['data'];
      List<GuestModel> s = List.from((data).map((e) => GuestModel()));
      return s;
    } else {
      throw Exception();
    }
  }
}
