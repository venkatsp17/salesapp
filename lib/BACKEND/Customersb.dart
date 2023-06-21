import 'dart:convert';

import 'package:http/http.dart' as http;

class Customersb{

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