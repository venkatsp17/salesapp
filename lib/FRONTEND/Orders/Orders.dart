import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sales/BACKEND/Customersb.dart';
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
  final Customersb obj1 = Customersb();
  List<Order> notapproved = [];
  List<Order> pending = [];
  List<Order> approved = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchOrderData();
    super.initState();
  }

  Future<void> fetchOrderData() async {
    final resultant = await obj.makeGetRequest("Not Approved");
    final resultant1 = await obj.makeGetRequest("Pending");
    final resultant2 = await obj.makeGetRequest("Approved");
    setState(() {
      notapproved = resultant;
      pending = resultant1;
      approved = resultant2;
    });

    // print(approved[0]);
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
      body: approved.isEmpty && notapproved.isEmpty && pending.isEmpty?
         Center(child: LoadingAnimationWidget.hexagonDots(color: Colors.black, size: 50),)
      :SingleChildScrollView(
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
                                    "Not Approved",
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
                          expanded: notapproved.isEmpty
                              ? const Text("No Data")
                              : CList(context, notapproved, Color(0xffFBC490),
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
                          expanded: approved.isEmpty
                              ? const Text("No Data")
                              : CList(context, approved, Color(0xffFBC490),
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
                          expanded: pending.isEmpty
                              ? const Text("No Data")
                              : CList(context, pending, const Color(0xffF36870),
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

    Future<String> GetName(int id) async{
      final customer = await obj1.makeGetRequest(id);
      return customer.CustomerName.toString();
    }

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
                                ),FutureBuilder(
                                    future: GetName(cdata[index].CustomerId),
                                    builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          snapshot.data.toString(),
                                          style: TextStyle(
                                            fontSize: width * 3.5,
                                          ),
                                        );
                                      }
                                      else if(snapshot.hasError){
                                        return const Text("Error");
                                      }
                                      return const CircularProgressIndicator(strokeWidth: 1.0,);
                                    }
                                )
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
                                  cdata[index].OrderId.toString(),
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
                                  cdata[index].OrderDate,
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
                                  cdata[index].OrderStatus,
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
