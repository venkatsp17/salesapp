import 'package:expandable/expandable.dart';
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
  @override
  Widget build(BuildContext context) {
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
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Customer Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
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
                  "Order Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ExpandablePanel(
              header: Container(
                color: Colors.white,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Payment Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              collapsed: const Text(
                "",
                softWrap: true,
                maxLines: 1,
              ),
              expanded: CList(context, data2, data1, Colors.white70,Colors.grey),
              theme: const ExpandableThemeData(hasIcon: false),
            ),
          ],
        ),
      )
    );
  }

  Widget CList(BuildContext context, cdata, pdata, Color color,  Color color1){
    return  Container(
      color: color,
      height: 500,
      width: double.infinity,
      child: SingleChildScrollView(
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
        ),
      )
    );
  }
}
