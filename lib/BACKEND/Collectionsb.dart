import 'dart:convert';

import 'package:http/http.dart' as http;

class Collectionsb{

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