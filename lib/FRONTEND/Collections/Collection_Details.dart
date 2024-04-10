// import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sales/BACKEND/Customersb.dart';
import 'package:sales/BACKEND/Ordersb.dart';
import 'package:sales/FRONTEND/Customers/Customer_Details.dart';

import '../../BACKEND/detailsb.dart';
import '../Orders/Order_Details.dart';
import 'Payment_Details.dart';

class Collection_details extends StatefulWidget {
  final details;
  const Collection_details({Key? key, this.details}) : super(key: key);

  @override
  State<Collection_details> createState() => _Collection_detailsState();
}

class _Collection_detailsState extends State<Collection_details> {
  final Detailsb obj = Detailsb();
  final Customersb obj1 = Customersb();
  List orders = [];
  List payments = [];
  late Customer1 customer;
  late Order order;
  late Map<String, dynamic> payment;


  @override
  void initState() {
    // TODO: implement initState
    if(widget.details != "Nil"){
      // print(widget.details.CustomerId);
      String id = (widget.details.CustomerId).toString();
      getopvalues(id);
    }
    super.initState();
  }

  getopvalues(String id) async {

    obj1.makeGetRequest(int.parse(id)).then((value) async {

      dynamic resultant = await obj.makeGetRequest1(id);
      if (resultant == null) {
        print("Unable to retrieve");
      } else {
        setState(() {
          customer = value;
          orders = resultant[0];
          payments = resultant[1];
        });
        assignvalues();
      }
    });

  }

  assignvalues() {
    setState(() {
      _cmpname.text = customer.CustomerName;
      _customerdisname.text = customer.ContactPerson;
      _customerph.text = customer.PhoneNumber1;
      _gst.text = "";
      _balance.text = customer.TotalPendingAmount;
    });
  }

  String total(List ar) {
    int tot = 0;
    for (int i = 0; i < ar.length; i++) {
      tot += int.parse(ar[i]);
    }
    return tot.toString();
  }

  filterdata(String id) async {
    dynamic customers = await obj.getcustomers("Null");
    List? cust;
    setState(() {
      cust = customers;
    });
    for (int i = 0; i < cust!.length; i++) {
      if (int.parse(id) == cust![i]['CustomerId']) {
        setState(() {
          _orderdate.text = '';
          _deliverymethod.text = '';
          _paymentmethod.text = '';
        });
        getopvalues(id);
      }
    }
  }


  final TextEditingController _cmpname = TextEditingController();
  final TextEditingController _customerdisname = TextEditingController();
  final TextEditingController _customerph = TextEditingController();
  final TextEditingController _gst = TextEditingController();
  final TextEditingController _orderdate = TextEditingController();
  final TextEditingController _deliverymethod = TextEditingController();
  final TextEditingController _paymentmethod = TextEditingController();
  final TextEditingController _balance = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;


    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "Details",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: width*5, color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xffA09191),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height*1,
              ),
              Container(
                height: height*23,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Customer Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width*4.5,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2.0, bottom: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "Company name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width*3.4,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            height: height*3,
                            width: width*46,
                            child: TypeAheadField<Customer?>(
                              textFieldConfiguration: TextFieldConfiguration(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                  controller: _cmpname),
                              suggestionsCallback: (pattern) async {
                                return await obj.getcustomers(pattern);
                              },
                              itemBuilder: (context, Customer? suggestion) {
                                final customer = suggestion!;
                                return ListTile(
                                  title: Text(customer.name),
                                  subtitle: Text(customer.address),
                                );
                              },
                              onSuggestionSelected: (Customer? suggestion) {
                                final customer = suggestion!;
                                filterdata((customer.id).toString());
                              },
                            ),
                            // child: TextField(
                            //   decoration: const InputDecoration(
                            //     fillColor: Colors.white70,
                            //     filled: true,
                            //     border: OutlineInputBorder(),
                            //   ),
                            //   controller: _cmpname
                            // ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2.0, bottom: 2.0),
                      child:
                      textfield("Customer Display Name", _customerdisname),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: textfield("Customer phone", _customerph)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "GST IN:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width*3.5,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: height*3,
                              width: width*37,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white70,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: _gst),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Customerdetails(data: customer)));
                          },
                          child: const Text(
                            'more details>>',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height,
              ),
              Container(
                height: height*19,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width*4.5,
                            color: Colors.black),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 2.0, right: 2.0, bottom: 3.0),
                          child: textfield("Order Date", _orderdate)),
                      Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: textfield("Discount Amount", _deliverymethod)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              try{
                                if(order != null){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Orderdetails(data: order)));
                                }
                              }
                              catch(e){
                                const snackBar = SnackBar(content: Text('Please select a order first'));
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                });
                                print(e);
                              }
                            },
                            child: const Text(
                              'more details>>',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height,
              ),
              Container(
                height: height*19,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width*4.5,
                            color: Colors.black),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: textfield("Payment Method", _paymentmethod)),
                      Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: textfield("Balance Amount", _balance)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              try{
                                if(payment.isNotEmpty){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Paymentdetails(data: payment)));
                                }
                              }
                              catch(e){
                                const snackBar = SnackBar(content: Text('Please select a payment first'));
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                });
                                print(e);
                              }
                            },
                            child: const Text(
                              'more details>>',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height,
              ),
              CList(context, orders, payments, Colors.white70, Colors.grey),
              SizedBox(
                height: height,
              ),
            ],
          ),
        ));
  }

  Widget textfield(String name, TextEditingController cnt) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;

    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width*3.4,
                  color: Colors.black),
            ),
          ),
          Container(
            height: height*3,
            width: width*46,
            child: TextField(
                readOnly: true,
                decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                controller: cnt),
          ),
        ],
      ),
    );
  }

  Widget CList(BuildContext context, cdata, pdata, Color color, Color color1) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;


    return Container(
        color: color,
        height: height*72,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.center,
                color: Colors.deepOrange,
                height: height*4,
                width: width*25,
                child: Text(
                  "OUT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width*4.5,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ORDER ID",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width*4.5,
                        color: Colors.black),
                  ),
                  // Text(
                  //   "DELIVERY DATE",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: width*4.5,
                  //       color: Colors.black),
                  // ),
                  Text(
                    "STATUS",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width*4.5,
                        color: Colors.black),
                  ),
                  Text(
                    "AMOUNT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width*4.5,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              height: height*23,
              child: ListView.builder(
                  itemCount: cdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            order = Order.fromJson(cdata[index]);
                            _orderdate.text = cdata[index]['OrderDate'];
                            _deliverymethod.text = cdata[index]['DiscountAmount'];
                          });
                        },
                        child: Container(
                          color: Colors.orangeAccent,
                          height: height*4.8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  cdata[index]["OrderId"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*4.5,
                                      color: Colors.black),
                                ),
                                Text(
                                  cdata[index]["OrderStatus"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*4.5,
                                      color: Colors.black),
                                ),
                                Text(
                                  cdata[index]["Total"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*4.5,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.center,
                color: Colors.green,
                height: height*4,
                width: width*25,
                child: Text(
                  "IN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width*4.5,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PAYMENT ID",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width*4.5,
                        color: Colors.black),
                  ),
                  Text(
                    "DATE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width*4.5,
                        color: Colors.black),
                  ),
                  // Text(
                  //   "STATUS",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: width*4.5,
                  //       color: Colors.black),
                  // ),
                  Text(
                    "AMOUNT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width*4.5,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              height: height*23,
              child: ListView.builder(
                  itemCount: pdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            payment = pdata[index];
                            _paymentmethod.text = pdata[index]['PaymentMode'];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: pdata[index]['ReceivedDate'] != '' || pdata[index]['ReceivedDate'] != null
                                ? Border.all(width: 0)
                                : Border.all(),
                            color: pdata[index]['ReceivedDate'] != '' || pdata[index]['ReceivedDate'] != null
                                ? Colors.orangeAccent
                                : Colors.transparent,
                          ),
                          height: height*4.8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  pdata[index]["CollectionId"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*4.5,
                                      color: Colors.black),
                                ),
                                Text(
                                  pdata[index]["ReceivedDate"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*4.5,
                                      color: Colors.black),
                                ),
                                // Text(
                                //   pdata[index]["CollectionNotes"],
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: width*4.5,
                                //       color: Colors.black),
                                // ),
                                Text(
                                  pdata[index]["Amount"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*4.5,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
