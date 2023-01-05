import 'package:flutter/material.dart';

class Orderdetails extends StatefulWidget {
  final data;
  const Orderdetails({Key? key, this.data}) : super(key: key);

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {

  List data4 = [
    {
      "name":"APPLE LIME",
      "qty":"3000",
      "rate":"300",
      "amt":"9000"
    },
    {
      "name":"APPLE LIME",
      "qty":"30",
      "rate":"300",
      "amt":"9000"
    },
    {
      "name":"APPLE LIME",
      "qty":"30",
      "rate":"300",
      "amt":"9000"
    },
  ];


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
          "Order Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: width*4.5, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            view( context,"Customer Name", widget.data["customername"]),
            view( context,"Order ID", widget.data["orderid"]),
            view( context,"Sales Order Date", widget.data["date"]),
            view( context,"Delivery Method", widget.data["delivery"]),
            view( context,"Total", widget.data["total"]),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: height*0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ITEM DETAILS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width*4.5,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Container(
                color: Colors.blueGrey,
                width: double.infinity,
                height: height*4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NAME",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width*4.5,
                          color: Colors.black),
                    ),
                    Text(
                      "KG",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width*4.5,
                          color: Colors.black),
                    ),
                    Text(
                      "QTY",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width*4.5,
                          color: Colors.black),
                    ),
                    Text(
                      "RATE",
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
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: height*20,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: widget.data['productnames'].length,
                    itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width*15,
                        child: Text(
                          widget.data['productnames'][index],
                          style: TextStyle(
                              fontSize: width*4.5,
                              fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: width*12,
                        child: Text(
                          '100',
                          style: TextStyle(
                            fontSize: width*4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width*12,
                        child: Text(
                          widget.data['productqty'][index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: width*4.5,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width*12,
                        child: Text(
                          widget.data['productrate'][index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: width*4.5,
                              fontWeight: FontWeight.bold,
                           ),
                        ),
                      ),
                      SizedBox(
                        width: width*14,
                        child: Text(
                          widget.data['productamt'][index],
                          textAlign: TextAlign.center,
                          style:TextStyle(
                              fontSize: width*4.5,
                              fontWeight: FontWeight.bold,
                             ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: height*0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "REMARKS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width*4.5,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.grey[200],
                width: double.infinity,
                height: height*20,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.data['remarks'],
                      style: TextStyle(
                          fontSize: width*4.5,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            view( context,"Expected Delivery Date", widget.data["date"]),
            view( context,"Delivery From", "XYZNEKSLDBEJKWJFESIOFESFJESOFEJOFW"),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget view(BuildContext context,Name, value) {

    var size = MediaQuery.of(context).size;
    var width = size.width/100;


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width*35,
            child: Text(
              Name,
              style: TextStyle(
                  fontSize: width*4.5,
                  fontWeight: FontWeight.bold,
                 ),
            ),
          ),
          SizedBox(
            width: width*45,
            child: Text(
              value,
              style: TextStyle(
                fontSize: width*4.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
