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
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Order Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              view("Customer Name", widget.data["customername"]),
              view("Order ID", widget.data["orderid"]),
              view("Sales Order Date", widget.data["date"]),
              view("Delivery Method", widget.data["delivery"]),
              view("Total", widget.data["total"]),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 2,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ITEM DETAILS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Container(
                  color: Colors.blueGrey,
                  width: double.infinity,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "NAME",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Text(
                        "QTY",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Text(
                        "RATE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Text(
                        "AMOUNT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: widget.data['productnames'].length,
                      itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Text(
                              widget.data['productnames'][index],
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Text(
                              widget.data['productqty'][index],
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              widget.data['productrate'][index],
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                               ),
                            ),
                          ),
                          Text(
                            widget.data['productamt'][index],
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                               ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 2,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "REMARKS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: 200,
                  child: const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              view("Expected Delivery Date", widget.data["date"]),
              view("Delivery From", "XYZNEKSLDBEJKWJFESIOFESFJESOFEJOFW"),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget view(Name, value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              Name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                 ),
            ),
          ),
          SizedBox(
            width: 160,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
