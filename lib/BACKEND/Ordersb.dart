import 'dart:convert';

import 'package:http/http.dart' as http;

class Ordersb{

  Future makeGetRequest() async {
    final url2 = Uri.parse("http://127.0.0.1:8000/api/orders/");
    http.Response response = await http.get(url2);
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    print('Body: ${response.body}');
    List? orderlist = [];
    List? resbody = jsonDecode(response.body);
    int? len = resbody?.length;
    if(response.statusCode==200) {
      for (int i = 0; i < len!; i++) {
        orderlist.add(resbody![i]);
      }
      return orderlist;
    }
    else{
      print("Unable to retrieve data");
      return null;
    }
  }
}