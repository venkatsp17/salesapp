import 'dart:convert';

import 'package:http/http.dart' as http;

class Customer1 {
  final int CustomerId;
  final String CustomerName;
  final String ContactPerson;
  final String Address;
  final String City;
  final String Country;
  final String Email;
  final String PhoneNumber1;
  final String PhoneNumber2;
  final String Pincode;
  final String State;
  final String TotalPendingAmount;

  const Customer1( {
    required this.CustomerId,
    required this.CustomerName,
    required this.ContactPerson,
    required this.Address,
    required this.City,
    required this.Country,
    required this.Email,
    required this.PhoneNumber1,
    required this.PhoneNumber2,
    required this.Pincode,
    required this.State,
    required this.TotalPendingAmount,
  });

  factory Customer1.fromJson(Map<String, dynamic> json) {
    return Customer1(CustomerId: json["CustomerId"],
        CustomerName: json["CustomerName"],
        ContactPerson: json["ContactPerson"],
        Address: json["Address"],
        City: json["City"],
        Country: json["Country"],
        Email: json["Email"],
        PhoneNumber1: json["PhoneNumber1"],
        PhoneNumber2: json["PhoneNumber2"],
        Pincode: json["Pincode"],
        State: json["State"],
        TotalPendingAmount: json["TotalPendingAmount"]);
  }
}

class Customersb{

  Future<Customer1> makeGetRequest(int customerid) async {
    final url2 = Uri.parse("http://10.0.2.2:8000/api/getcustdata/");
    http.Response response = await http.post(
      url2,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode( {
        "CustomerId": customerid,
      }),
    );
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
    Customer1 customer;
    if(response.statusCode==200) {
      customer = Customer1.fromJson(jsonDecode(response.body));
      return customer;
    }
    else{
      throw Exception('Failed to load users. Status code: ${response.statusCode}');
    }
  }

  Future createcustomer(String cid, String type, String primaryc,
      String cmpname, String cdname, String cusph, String gstin, String bankname, String accntno, String ifsccode,
      String branchname, String pan, String address, String country, String state, String city, String pincode,
      String openingb, String payterms, String name, String mobno) async{
    final url2 = Uri.parse("http://127.0.0.1:8000/api/createcustomer/");
    http.Response response = await http.post(
      url2,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'accountno': accntno,
        'address': address,
        'bankname': bankname,
        'branch': branchname,
        'city': city,
        'companyname': cmpname,
        'country': country,
        'customerdisname': cdname,
        'customerid': cid,
        'customerph': cusph,
        'customertype': type,
        'gstin': gstin,
        'ifsccode': ifsccode,
        'mobileno': mobno,
        'name': name,
        'openingbalance': openingb,
        'orderamts': [],
        'orderdates': [],
        'panno': pan,
        'paymentterms': payterms,
        'pincode': pincode,
        'primarycontact': primaryc,
        'state': state
      }),
    );
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
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