import 'package:flutter/cupertino.dart';
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
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: height*60,
                width: double.infinity,
                child: CupertinoScrollbar(
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.data['products'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          // color: Colors.green,
                          height: height*35,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Item ${index+1}",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width*4.5,
                                    color: Colors.black
                                ),),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Product Name: ",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width*3.5,
                                            color: Colors.black
                                        ),),
                                        Text(widget.data['products'][index]['itemname'],style: TextStyle(
                                            fontSize: width*3.5,
                                            color: Colors.black
                                        ),),
                                      ],
                                    ),

                                    SizedBox(
                                      height: height*4,
                                      width: width*22,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Discount: ",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: width*3.5,
                                              color: Colors.black
                                          ),),
                                          Text(widget.data['products'][index]['discount'],style: TextStyle(
                                              fontSize: width*3.5,
                                              color: Colors.black
                                          ),),
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.blueGrey,
                                  height: height*2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "KG",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width*3,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "QTY",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width*3,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "RATE",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width*3,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "AMOUNT",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width*3,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height*20,
                                  child: ListView.builder(
                                      itemCount: widget.data['products'][index]['details'].length,
                                      itemBuilder: (BuildContext context, int index1){
                                        return Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: height*5.8,
                                                  width: width*25,
                                                  child: Text(widget.data['products'][index]['details'][index1]['KG'].toString())
                                                ),
                                                SizedBox(
                                                  height: height*5,
                                                  width: width*20,
                                                  child: Text(widget.data['products'][index]['details'][index1]['qty'].toString())
                                                ),
                                                SizedBox(
                                                  height: height*5,
                                                  width: width*20,
                                                  child: Text(widget.data['products'][index]['details'][index1]['rate'].toString())
                                                ),
                                                SizedBox(
                                                  height: height*5,
                                                  width: width*20,
                                                  child: Text(widget.data['products'][index]['details'][index1]['amount'].toString())
                                                ),
                                              ],
                                            ),
                                        );
                                      }
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: height*3,
                                    color: Colors.grey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "SUB TOTAL",
                                            style: TextStyle(
                                              fontSize: width*3,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            widget.data['products'][index]['stotal'].toString(),
                                            style: TextStyle(
                                              fontSize: width*3,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
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
