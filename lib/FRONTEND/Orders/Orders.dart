import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sales/FRONTEND/Customers/NewCustomer/NewCustomer.dart';
import 'package:sales/FRONTEND/Orders/NewOrder.dart';
import 'package:sales/FRONTEND/Orders/Order_Details.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List data2 = [
    {
      "customername": "Venkat Raman S P",
      "orderid": "O328",
      "date": "01/09/2002",
      "status": "Not Approved",
      "payment": "Cash",
      "delivery": "Method1",
      "total":"50000000"
    },
    {
      "customername": "Venkat S P",
      "orderid": "O328",
      "date": "01/09/2002",
      "status": "Pending",
      "payment": "Cash",
      "delivery": "Method1",
      "total":"50000000"
    }
  ];
  List data1 = [
  {
  "customername": "Venkat Raman S P",
  "orderid": "O328",
  "date": "01/09/2002",
  "status": "Approved",
    "payment": "Cash",
    "delivery": "Method1",
    "total":"50000000"
},
    ];
  List data = [
    {
      "customername": "Venkat Raman S P",
      "orderid": "O328",
      "date": "01/09/2002",
      "status": "Delivered",
      "payment": "Cash",
      "delivery": "Method1",
      "total":"50000000"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PopupMenuButton<int>(
        itemBuilder: (context1) => [
          // popupmenu item 1
          PopupMenuItem(
            value: 1,
            child: const Text("New Order"),
            onTap: () async{
              final navigator = Navigator.of(context);
              await Future.delayed(Duration.zero);
              navigator.push(
                MaterialPageRoute(builder: (_) => const Neworder()),
              );
            },
          ),
          // popupmenu item 2
          PopupMenuItem(
            onTap: ()async{
              final navigator = Navigator.of(context);
              await Future.delayed(Duration.zero);
              navigator.push(
                MaterialPageRoute(builder: (_) => const Newcustomer()),
              );
            },
            value: 2,
            child: Text("New Customer"),
          ),
        ],
        offset: const Offset(-70, -60),
        color: Colors.white,
        elevation: 2,
        child: const Icon(Icons.add_circle,size: 70,),
      ),
      backgroundColor: const Color(0xffA09191),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  ExpandablePanel(
                    header: Container(
                      color: Colors.white,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                              Text("Delivery",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            Icon(Icons.circle,color: Colors.green,size: 30,)
                          ],
                        ),
                      ),
                    ),
                    collapsed: const Text(
                      "",
                      softWrap: true,
                      maxLines: 1,
                    ),
                    expanded: CList(context, data, Color(0xffB6E2D3), Colors.green),
                    theme: const ExpandableThemeData(hasIcon: false),
                  ),
                  ExpandablePanel(
                    header: Container(
                      color: Colors.white,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Approved",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.circle,color: Colors.orange,size: 30,)
                          ],
                        ),
                      ),
                    ),
                    collapsed: const Text(
                      "",
                      softWrap: true,
                      maxLines: 1,
                    ),
                    expanded: CList(context, data1, Color(0xffFBC490), Colors.orange),
                    theme: const ExpandableThemeData(hasIcon: false),
                  ),
                  ExpandablePanel(
                    header: Container(
                      color: Colors.white,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Pending",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.circle,color: Colors.red,size: 30,)
                          ],
                        ),
                      ),
                    ),
                    collapsed: const Text(
                      "",
                      softWrap: true,
                      maxLines: 1,
                    ),
                    expanded: CList(context, data2, Color(0xffF36870),Colors.red),
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

  Widget CList(BuildContext context, cdata, Color color,  Color color1){
    return  Container(
      color: color,
      height: 400,
      child: ListView.builder(
          itemCount: cdata.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      Orderdetails(data: cdata[index])),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: Container(
                  height: 100,
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
                                const Text("Customer Name: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(cdata[index]["customername"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Order ID: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(cdata[index]["orderid"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Order Date: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(cdata[index]["date"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 120,
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Status",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                alignment: Alignment.center,
                                width: 130,
                                child: Text(cdata[index]['status'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: color1,
                                    fontSize: 15,
                                  ),),
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
          }
      ),
    );
  }

}
