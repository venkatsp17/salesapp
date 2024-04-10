import 'dart:convert';

import 'package:http/http.dart' as http;

class Order {
  final int OrderId;
  final int CustomerId;
  final String CGST;
  final String SGST;
  final String SubTotal;
  final String Total;
  final String DiscountAmount;
  final String OrderDate;
  final String OrderNotes;
  final String OrderStatus;
  final String ProductIds;
  final String Quantities;

  const Order( {
    required this.OrderId,
    required this.CustomerId,
    required this.CGST,
    required this.SGST,
    required this.SubTotal,
    required this.Total,
    required this.DiscountAmount,
    required this.OrderDate,
    required this.OrderNotes,
    required this.OrderStatus,
    required this.ProductIds,
    required this.Quantities,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(OrderId: json["OrderId"],
        CustomerId: json["CustomerId"],
        CGST: json["CGST"],
        SGST: json["SGST"],
        SubTotal: json["SubTotal"],
        Total: json["Total"],
        DiscountAmount: json["DiscountAmount"],
        OrderDate: json["OrderDate"],
        OrderNotes: json["OrderNotes"],
        OrderStatus: json["OrderStatus"],
        ProductIds: json["ProductIds"],
        Quantities: json["Quantities"]);
  }
}

class Ordersb{

  Future<List<Order>> makeGetRequest(String status) async {
    final url2 = Uri.parse("http://10.0.2.2:8000/api/orders/");
    http.Response response = await http.post(
      url2,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "OrderId": 0,
        "Status": status,
      }),
    );
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
    List<Order> orders = [];
    List<dynamic> resbody = json.decode(response.body);
    int? len = resbody.length;
    if(response.statusCode==200) {
      orders = resbody.map((data) => Order.fromJson(data)).toList();
      return orders;
    }
    else{
      throw Exception('Failed to load users. Status code: ${response.statusCode}');
    }
  }

  Future createorder(String cid, String oid, String cname,
      String date, String delm, String totalamt,
      String discountamt, String remarks, String deldate, List pdetails) async{
    final url2 = Uri.parse("http://10.0.2.2:8000/api/createorder/");
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