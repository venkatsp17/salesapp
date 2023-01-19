import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sales/BACKEND/Ordersb.dart';
import 'package:sales/FRONTEND/Customers/NewCustomer/NewCustomer.dart';
import 'package:sales/FRONTEND/Orders/NewOrder.dart';
import 'package:sales/FRONTEND/Orders/Order_Details.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final Ordersb obj = Ordersb();
  List data = [];
  List data1 = [];
  List data2 = [];
  @override
  void initState() {
    // TODO: implement initState
    fetchOrderData();
    super.initState();
  }

  fetchOrderData() async {
    dynamic resultant = await obj.makeGetRequest();
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        for (int i = 0; i < resultant.length; i++) {
          if (resultant[i]['status'] == "Not Approved" ||
              resultant[i]['status'] == "Pending") {
            data2.add(resultant[i]);
          } else if (resultant[i]['status'] == "Approved") {
            data1.add(resultant[i]);
          } else {
            data.add(resultant[i]);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Scaffold(
      floatingActionButton: PopupMenuButton<int>(
        itemBuilder: (context1) => [
          // popupmenu item 1
          PopupMenuItem(
            value: 1,
            child: const Text("New Order"),
            onTap: () async {
              final navigator = Navigator.of(context);
              await Future.delayed(Duration.zero);
              navigator.push(
                MaterialPageRoute(builder: (_) => const Neworder()),
              );
            },
          ),
          // popupmenu item 2
          PopupMenuItem(
            onTap: () async {
              final navigator = Navigator.of(context);
              await Future.delayed(Duration.zero);
              navigator.push(
                MaterialPageRoute(builder: (_) => const Newcustomer()),
              );
            },
            value: 2,
            child: const Text("New Customer"),
          ),
        ],
        offset: const Offset(-70, -60),
        color: Colors.white,
        elevation: 2,
        child: const Icon(
          Icons.add_circle,
          size: 70,
        ),
      ),
      backgroundColor: const Color(0xffA09191),
      body: data2.isEmpty && data.isEmpty && data1.isEmpty
          ? Center(
              child: LoadingAnimationWidget.hexagonDots(color: Colors.black, size: 50),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        ExpandablePanel(
                          header: Container(
                            color: Colors.white,
                            height: height * 8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                          collapsed: const Text(
                            "",
                            softWrap: true,
                            maxLines: 1,
                          ),
                          expanded: (data.isEmpty)
                              ? const Text("No Data")
                              : CList(context, data, const Color(0xffB6E2D3),
                                  Colors.green),
                          theme: const ExpandableThemeData(hasIcon: false),
                        ),
                        ExpandablePanel(
                          header: Container(
                            color: Colors.white,
                            height: height * 8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Approved",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.orange,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                          collapsed: const Text(
                            "",
                            softWrap: true,
                            maxLines: 1,
                          ),
                          expanded: (data1.isEmpty)
                              ? const Text("No Data")
                              : CList(context, data1, Color(0xffFBC490),
                                  Colors.orange),
                          theme: const ExpandableThemeData(hasIcon: false),
                        ),
                        ExpandablePanel(
                          header: Container(
                            color: Colors.white,
                            height: height * 8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pending",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                          collapsed: const Text(
                            "",
                            softWrap: true,
                            maxLines: 1,
                          ),
                          expanded: (data2.isEmpty)
                              ? const Text("No Data")
                              : CList(context, data2, const Color(0xffF36870),
                                  Colors.red),
                          theme: const ExpandableThemeData(hasIcon: false),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget CList(BuildContext context, cdata, Color color, Color color1) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Container(
      color: color,
      height: height * 40,
      child: ListView.builder(
          itemCount: cdata.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Orderdetails(data: cdata[index])),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: Container(
                  height: height * 10,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white70,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Customer Name: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 3.5,
                                  ),
                                ),
                                Text(
                                  cdata[index]["customername"],
                                  style: TextStyle(
                                    fontSize: width * 3.5,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Order ID: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 3.5,
                                  ),
                                ),
                                Text(
                                  cdata[index]["orderid"],
                                  style: TextStyle(
                                    fontSize: width * 3.5,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Order Date: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 3.5,
                                  ),
                                ),
                                Text(
                                  cdata[index]["date"],
                                  style: TextStyle(
                                    fontSize: width * 3.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: width * 35,
                          height: height * 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                    fontSize: width * 3.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                                alignment: Alignment.center,
                                width: width * 25,
                                child: Text(
                                  cdata[index]['status'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: color1,
                                    fontSize: width * 3.5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
