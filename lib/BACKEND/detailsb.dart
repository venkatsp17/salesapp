import 'dart:convert';

import 'package:http/http.dart' as http;


class Customer{
  final String name;
  final String address;
  final int id;

  const Customer({
    required this.name,
    required this.address,
    required this.id
  });

  static Customer fromJson(Map<String,dynamic> data) => Customer(
      name: data['CustomerName'],
      address: data['Address'],
      id: data['CustomerId'],
  );

}

class Detailsb{
  //http://127.0.0.1:8000/
  //http://10.0.2.2:8000/
  var u = "http://10.0.2.2:8000/";

  Future makeGetRequest() async {
    final url2 = Uri.parse("${u}api/collection/");
    http.Response response = await http.get(url2);
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
    List? collectionlist = [];
    List? resbody = jsonDecode(response.body);
    int? len = resbody?.length;
    if(response.statusCode==200) {
      for (int i = 0; i < len!; i++) {
        collectionlist.add(resbody![i]);
      }
      return collectionlist;
    }
    else{
      print("Unable to retrieve data");
      return null;
    }
  }
  Future makeGetRequest1(String id) async {
    final url2 = Uri.parse("${u}api/corders/$id");
    final url3 = Uri.parse("${u}api/ccollections/$id");
    http.Response response = await http.get(url2);
    http.Response response1 = await http.get(url3);
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
    // print('Body1: ${response1.body}');
    List? orderlist = [];
    List? paymentlist = [];
    List? resbody = jsonDecode(response.body);
    List? resbody1 = jsonDecode(response1.body);
    int? len = resbody?.length;
    int? len1 = resbody1?.length;
    if(response.statusCode==200 || response1.statusCode==200) {
      for(int j=0;j<len1!;j++){
        paymentlist.add(resbody1![j]);
      }
      for (int i = 0; i < len!; i++) {
        orderlist.add(resbody![i]);
      }
      return [orderlist,paymentlist];
    }
    else{
      print("Unable to retrieve data");
      return null;
    }
  }

  Future getcustomers(String query) async {
    final url2 = Uri.parse("${u}api/ucustomers/0");
    http.Response response = await http.get(url2);
    // print('Body: ${response.body}');
    List? resbody = jsonDecode(response.body);
    if (query=="Null"){
      if(response.statusCode==200){
        return resbody;
      }
      else{
        print("Unable to retrieve data");
        return null;
      }
    }
    else{
      if(response.statusCode==200) {
        return resbody?.map((data) => Customer.fromJson(data)).where((element) {
          final namelower = element.name.toLowerCase();
          final  querylower = query.toLowerCase();
          return namelower.contains(querylower);
        }).toList();
      }
      else{
        print("Unable to retrieve data");
        return null;
      }
    }
  }
}
