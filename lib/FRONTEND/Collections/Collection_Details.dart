// import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../BACKEND/detailsb.dart';


class Collection_details extends StatefulWidget {
  final details;
  const Collection_details({Key? key, this.details}) : super(key: key);

  @override
  State<Collection_details> createState() => _Collection_detailsState();
}

class _Collection_detailsState extends State<Collection_details> {


  final Detailsb obj = Detailsb();
  List orders = [];
  List payments = [];

  @override
  void initState() {
    // TODO: implement initState
    getopvalues();
    assignvalues();
    super.initState();
  }
  getopvalues() async{
    dynamic resultant = await obj.makeGetRequest1(widget.details['customerid']);
    if(resultant==null){
      print("Unable to retrieve");
    }else{
      setState(() {
        orders = resultant[0];
        payments = resultant[1];
      });
    }
  }
  assignvalues(){
    _cmpname.text = widget.details['companyname'];
    _customerdisname.text = widget.details['customerdisname'];
    _customerph.text = widget.details['customerph'];
    _gst.text = widget.details['gstin'];
    _balance.text = widget.details['openingbalance'];
  }
  String total(List ar){
    int tot = 0;
    for(int i=0;i<ar.length;i++){
      tot += int.parse(ar[i]);
    }
    return tot.toString();
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


    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      backgroundColor: const Color(0xffA09191),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 160,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Customer Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0,bottom: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            "Company name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 200,
                            child:TypeAheadField<Customer?>(
                              textFieldConfiguration: const TextFieldConfiguration(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()
                                  )
                              ),
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
                              onSuggestionSelected: (suggestion) {

                              },
                            )
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
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0,bottom: 2.0),
                    child: textfield("Customer Display Name", _customerdisname),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                    child: textfield("Customer phone", _customerph)
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "GST IN:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 150,
                        child: TextField(
                          readOnly: true,
                            decoration: const InputDecoration(
                              fillColor: Colors.white70,
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                            controller: _gst
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            Container(
              height: 110,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0,right: 2.0,bottom: 3.0),
                      child: textfield("Order Date", _orderdate)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: textfield("Delivery Method", _deliverymethod)
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Payment Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: textfield("Payment Method", _paymentmethod)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: textfield("Balance Amount", _balance)
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CList(context, orders, payments, Colors.white70,Colors.grey),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )
    );
  }

  DateTime? _chosenDateTime;
  void _showDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 400,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _chosenDateTime ?? DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosenDateTime = val;
                      });
                    }),
              ),
            ],
          ),
        ));
  }

  Widget textfield(String name, TextEditingController cnt){
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            ),
          ),
          Container(
            height: 30,
            width: 200,
            child: TextField(
              readOnly: true,
                decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                controller: cnt
            ),
          ),
        ],
      ),
    );
  }

  Widget CList(BuildContext context, cdata, pdata, Color color,  Color color1){
    return  Container(
      color: color,
      height: 600,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              height: 50,
              width: 100,
              child:  const Text(
                "OUT",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "ORDER ID",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
                Text(
                  "DELIVERY DATE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
                Text(
                  "AMOUNT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            child: ListView.builder(
                itemCount: cdata.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                          setState(() {
                            _orderdate.text = cdata[index]['date'];
                            _deliverymethod.text = cdata[index]['delivery'];
                          });
                      },
                      child: Container(
                        color: Colors.blueGrey,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cdata[index]["orderid"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                              ),
                              Text(
                                cdata[index]["delivereddate"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                              ),
                              Text(
                                total(cdata[index]["productamt"]),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              height: 50,
              width: 100,
              child:  const Text(
                "IN",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "PAYMENT ID",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
                Text(
                  "DATE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
                Text(
                  "STATUS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
                Text(
                  "AMOUNT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            child: ListView.builder(
                itemCount: pdata.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                       setState(() {
                         _paymentmethod.text = pdata[index]['paymentmode'];
                       });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: pdata[index]['status']=='Verified'?Border.all(width: 0):Border.all(),
                          color: pdata[index]['status']=='Verified'?Colors.blueGrey:Colors.transparent,
                        ),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pdata[index]["paymentid"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                              ),
                              Text(
                                pdata[index]["paymentdate"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                pdata[index]["status"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                              ),
                              Text(
                                pdata[index]["amtreceived"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      )
    );
  }
}
