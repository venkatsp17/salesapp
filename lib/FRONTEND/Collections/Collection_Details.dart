// import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Collection_details extends StatefulWidget {
  final details;
  const Collection_details({Key? key, this.details}) : super(key: key);

  @override
  State<Collection_details> createState() => _Collection_detailsState();
}

class _Collection_detailsState extends State<Collection_details> {


  List data2 = [
    {
      "orderid": "O901",
      "deliverydate": "10-10-2022",
      "amount": "10000"
    },
    {
      "orderid": "O983",
      "deliverydate": "12-12-2022",
      "amount": "50000"
    },
    {
      "orderid": "O983",
      "deliverydate": "12-12-2022",
      "amount": "50000"
    }
  ];
  List data1 = [
    {
      "pid": "P901",
      "date": "10-10-2022",
      "status": "P",
      "amount": "10000"
    },
    {
      "pid": "P902",
      "date": "10-10-2022",
      "status": "P",
      "amount": "10000"
    },
    {
      "pid": "P903",
      "date": "10-10-2022",
      "status": "P",
      "amount": "10000"
    }
  ];

  final TextEditingController _cmpname = TextEditingController();
  final TextEditingController _customerdisname = TextEditingController();
  final TextEditingController _customerph = TextEditingController();
  final TextEditingController _gst = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _gst.text = "22AAAAA0000A1Z5";

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Collection Details",
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
                          child: TextField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white70,
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                            controller: _cmpname
                          ),
                        ),
                      ],
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
                            "Customer Display name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 200,
                          child: TextField(
                              decoration: const InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                              controller: _customerdisname
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            "Customer phone",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 200,
                          child: TextField(
                              decoration: const InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                              controller: _customerph
                          ),
                        ),
                      ],
                    ),
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
              height: 160,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              "Order Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _showDatePicker(context),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              alignment: Alignment.center,
                              height: 30,
                              width: 200,
                              child: _chosenDateTime == null
                                  ? const Text(
                                "Pick a Date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                                  : Text(
                                  _chosenDateTime.toString().substring(0, 10),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0,bottom: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              "Payment Terms",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 200,
                            child: TextField(
                                decoration: const InputDecoration(
                                  fillColor: Colors.white70,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                ),
                                controller: _customerph
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              "Delivery Method",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 200,
                            child: TextField(
                                decoration: const InputDecoration(
                                  fillColor: Colors.white70,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                ),
                                controller: _customerph
                            ),
                          ),
                        ],
                      ),
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
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Payment Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CList(context, data2, data1, Colors.white70,Colors.grey),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )
    );
  }

  DateTime? _chosenDateTime;
  // Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
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
                              cdata[index]["deliverydate"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              cdata[index]["amount"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                            ),
                          ],
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
                itemCount: cdata.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blueGrey,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pdata[index]["pid"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              pdata[index]["date"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                            ),
                            Text(
                              pdata[index]["status"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              pdata[index]["amount"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                            ),
                          ],
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
