import 'dart:convert';

import 'package:http/http.dart' as http;

class Ordersb{

  Future makeGetRequest() async {
    final url2 = Uri.parse("http://127.0.0.1:8000/api/orders/");
    http.Response response = await http.get(url2);
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
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

  Future createorder(String cid, String oid, String cname,
      String date, String delm, String totalamt,
      String discountamt, String remarks, String deldate, List pdetails) async{
    final url2 = Uri.parse("http://127.0.0.1:8000/api/createorder/");
    http.Response response = await http.post(
      url2,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'customerid': cid,
        'customername': cname,
        'date': date,
        'deliveryddate': deldate,
        'delivery': delm,
        'orderid': oid,
        'products': pdetails,
        'total': totalamt,
        'status': 'Pending',
        'remarks': remarks,
        'delivereddate': '',
      }),
    );
    String status= response.statusCode.toString();
    return status;
  }
}