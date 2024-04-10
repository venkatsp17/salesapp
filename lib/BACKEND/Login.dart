import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Login{
  Future<String> makeGetRequest(String username, String password) async {
    final url2 = Uri.parse("http://10.0.2.2:8000/api/login/");
    http.Response response = await http.post(
      url2,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "UserName": username,
        "Password": password,
      }),
    );
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
    final storage = FlutterSecureStorage();
    dynamic resbody = json.decode(response.body);
    print(resbody);
    // int? len = resbody.length;
    if(response.statusCode==200) {
      // storage.write(key: "User", value: jsonEncode(resbody));
      return resbody["access_token"]??"null";
    }
    else{
      return "null";
      throw Exception('Failed to Login Status code: ${response.statusCode}');
    }
  }
}