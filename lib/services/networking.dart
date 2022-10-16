import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);

  final Uri url;
  Future getData() async{

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
  }else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
}
}