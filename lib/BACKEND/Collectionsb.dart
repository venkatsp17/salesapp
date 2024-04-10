import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:http/http.dart' as http;

class Collection {
  final int CustomerId;
  final String CustomerName;
  final double TotalPendingAmount;
  final String LastCollection;

  const Collection( {
    required this.CustomerId,
    required this.CustomerName,
    required this.TotalPendingAmount,
    required this.LastCollection,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
        CustomerId: json["CustomerId"],
        CustomerName: json["CustomerName"],
        TotalPendingAmount: json["TotalPendingAmount"],
        LastCollection: json["last_collection"] ?? "null",
    );
  }
}

class Collectionsb{

  Future<List<Collection>> makeGetRequest() async {
    final url2 = Uri.parse("http://10.0.2.2:8000/api/ucollections/0");
    http.Response response = await http.get(url2);
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
    List<Collection> collections = [];
    List<dynamic> resbody = json.decode(response.body);
    int? len = resbody.length;
    if(response.statusCode==200) {
      collections = resbody.map((data) => Collection.fromJson(data)).toList();
      return collections;
    }
    else{
      throw Exception('Failed to load users. Status code: ${response.statusCode}');
    }
  }

  Future createcollection(String amt, String comp, String cid,
      String date, String pid, String pmode, String rem) async{
    final url2 = Uri.parse("http://127.0.0.1:8000/api/createcollection/");
    http.Response response = await http.post(
      url2,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'amtreceived': amt,
        'companyname': comp,
        'customerid': cid,
        'paymentdate': date,
        'paymentid': pid,
        'paymentmode': pmode,
        'remarks': rem,
        'status': "Not Verified"
      }),
    );
    String status= response.statusCode.toString();
    return status;
    // return http.post(
    //   url2,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode({
    //     'amtreceived': amt,
    //     'companyname': comp,
    //     'customerid': cid,
    //     'paymentdate': date,
    //     'paymentid': pid,
    //     'paymentmode': pmode,
    //     'remarks': rem,
    //     'status': "Not Verified"
    //   }),
    // );
  }

}