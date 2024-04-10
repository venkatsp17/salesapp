import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BACKEND/Customersb.dart';
import '../../BACKEND/Productsb.dart';

class Orderdetails extends StatefulWidget {
  final data;
  const Orderdetails({Key? key, this.data}) : super(key: key);

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {

  late Customer1 customer;

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
  void initState() {
    // TODO: implement initState
    if(widget.data != "Nil") {
        String id = (widget.data.CustomerId).toString();
        getopvalues(id);
        ConvertData();
    }
    super.initState();
  }

  final Customersb obj1 = Customersb();
  List ProductIds = [];
  List Quantities = [];
  final Productsb ob = Productsb();
  late List<Product> products;
  List ProductData = [];

  ConvertData() {
    print("Resultant");
    ob.getproducts("Null").then((value){
      products = value;
      if((widget.data.ProductIds).toString().contains(',')){
        ProductIds = (widget.data.ProductIds).toString().split(',');
      }
      else{
        ProductIds = [widget.data.ProductIds];
      }
      if((widget.data.Quantities).toString().contains(',')){
        Quantities = (widget.data.Quantities).toString().split(',');
      }
      else{
        Quantities = [widget.data.Quantities];
      }
      ProductData = products.where((product) => ProductIds.contains((product.ProductId).toString())).toList();
      // print("ProductData");
      // print(ProductData[0].ProductName);
    });


  }


  getopvalues(String id) async {


     obj1.makeGetRequest(int.parse(id)).then((value) async {

       if (value == null) {
         print("Unable to retrieve");
       } else {
         setState(() {
           try {
             customer = value;
           }
           catch(e){
             print(e);
           }
         });
       }
     });


  }


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
            view( context,"Customer Name", customer.CustomerName.toString()),
            view( context,"Order ID", widget.data.OrderId.toString()),
            view( context,"Sales Order Date", widget.data.OrderDate),
            // view( context,"Delivery Method", widget.data["delivery"]),
            view( context,"Total", widget.data.Total),
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
                height: height*40,
                width: double.infinity,
                child: CupertinoScrollbar(
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                      itemCount: ProductIds.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          // color: Colors.green,
                          height: height*20,
                          // height: height*35,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: Colors.deepOrange,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Item ${index+1}",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width*4.5,
                                        color: Colors.black
                                    ),),
                                  ),
                                ),
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
                                        Text(ProductData[index].ProductName,style: TextStyle(
                                            fontSize: width*3.5,
                                            color: Colors.black
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Product Qty: ",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width*3.5,
                                            color: Colors.black
                                        ),),
                                        Text(Quantities[index],style: TextStyle(
                                            fontSize: width*3.5,
                                            color: Colors.black
                                        ),),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: height*4,
                                    //   width: width*22,
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Text("Discount: ",style: TextStyle(
                                    //           fontWeight: FontWeight.bold,
                                    //           fontSize: width*3.5,
                                    //           color: Colors.black
                                    //       ),),
                                    //     ],
                                    //   )
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Product KG: ",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width*3.5,
                                        color: Colors.black
                                    ),),
                                    Text((ProductData[index].KG).toString(),style: TextStyle(
                                        fontSize: width*3.5,
                                        color: Colors.black
                                    ),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Product Price: ",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width*3.5,
                                        color: Colors.black
                                    ),),
                                    Text((ProductData[index].Price).toString(),style: TextStyle(
                                        fontSize: width*3.5,
                                        color: Colors.black
                                    ),),
                                  ],
                                ),
                                // Container(
                                //   color: Colors.blueGrey,
                                //   height: height*2,
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         "KG",
                                //         style: TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: width*3,
                                //             color: Colors.black),
                                //       ),
                                //       Text(
                                //         "QTY",
                                //         style: TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: width*3,
                                //             color: Colors.black),
                                //       ),
                                //       Text(
                                //         "RATE",
                                //         style: TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: width*3,
                                //             color: Colors.black),
                                //       ),
                                //       Text(
                                //         "AMOUNT",
                                //         style: TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: width*3,
                                //             color: Colors.black),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: height*20,
                                //   child: ListView.builder(
                                //       itemCount: widget.data['products'][index]['details'].length,
                                //       itemBuilder: (BuildContext context, int index1){
                                //         return Padding(
                                //             padding: const EdgeInsets.all(1.0),
                                //             child: Row(
                                //               mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //               children: [
                                //                 SizedBox(
                                //                   height: height*5.8,
                                //                   width: width*25,
                                //                   child: Text(widget.data['products'][index]['details'][index1]['KG'].toString())
                                //                 ),
                                //                 SizedBox(
                                //                   height: height*5,
                                //                   width: width*20,
                                //                   child: Text(widget.data['products'][index]['details'][index1]['qty'].toString())
                                //                 ),
                                //                 SizedBox(
                                //                   height: height*5,
                                //                   width: width*20,
                                //                   child: Text(widget.data['products'][index]['details'][index1]['rate'].toString())
                                //                 ),
                                //                 SizedBox(
                                //                   height: height*5,
                                //                   width: width*20,
                                //                   child: Text(widget.data['products'][index]['details'][index1]['amount'].toString())
                                //                 ),
                                //               ],
                                //             ),
                                //         );
                                //       }
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: height*7,
                color: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SUB TOTAL",
                        style: TextStyle(
                          fontSize: width*5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.data.SubTotal,
                        style: TextStyle(
                          fontSize: width*5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
                      widget.data.OrderNotes,
                      style: TextStyle(
                          fontSize: width*4.5,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            // view( context,"Expected Delivery Date", widget.data["date"]),
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
