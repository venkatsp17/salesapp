import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Neworder extends StatefulWidget {
  const Neworder({Key? key}) : super(key: key);

  @override
  State<Neworder> createState() => _NeworderState();
}

class _NeworderState extends State<Neworder> {
  double h = 1.0;
  int count = 1;
  final TextEditingController _orderid = TextEditingController();
  final TextEditingController _remarks = TextEditingController();
  String selectedValue = "";
  String? dropdownvalue = "Cash";
  String? dropdownvalue1 = "Method 12345";
  List<String> names = [
    "C109 : Venkat S P",
    "C110 : Venkat S P",
    "C111 : Venkat S P"
  ];
  List<String> items = ['Cash', 'Cheque', 'Online Payment', 'UPI'];
  List<String> items1 = ['Method 12345', 'Method 13545', 'Method 45645'];
  List orderitems = [
    {
      "itemname": TextEditingController(),
      "qty": TextEditingController(),
      "rate": TextEditingController(),
      "amount": TextEditingController()
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
          "New Order",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "Customer Name",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        width: 270,
                        height: 90,
                        child: DropdownSearch<String>(
                          mode: Mode.DIALOG,
                          showClearButton: true,
                          selectedItem: selectedValue,
                          showSelectedItems: true,
                          showSearchBox: true,
                          items: names,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "Order ID",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 265,
                        child: TextField(
                          controller: _orderid,
                          decoration: const InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            border: OutlineInputBorder(),
                            labelText: 'Order ID',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "Order Date",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 265,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            fillColor: Colors.white70,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          controller: TextEditingController(
                            text: (DateTime.now().toString().substring(0, 10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "Payment Method",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 145,
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "Delivery Method",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 145,
                        child: DropdownButton(
                          value: dropdownvalue1,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items1.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 160,
                    child: Text(
                      "ITEM DETAILS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 140 * h,
                    // color: Colors.blue,
                    child: CupertinoScrollbar(
                      child: ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: orderitems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // color: Colors.green,
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 265,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white70,
                                              filled: true,
                                              labelText: "ITEM NAME",
                                              border: OutlineInputBorder(),
                                            ),
                                            controller: orderitems[index]
                                                ['itemname'],
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                orderitems.removeAt(index);
                                                h = h - 0.9;
                                                count--;
                                                print("Decremented: $count");
                                                if (count == 1) {
                                                  h = 1.0;
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove_circle,
                                              color: Colors.red,
                                              size: 30,
                                            ))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 110,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white70,
                                              labelText: "OTY",
                                              filled: true,
                                              border: OutlineInputBorder(),
                                            ),
                                            controller: orderitems[index]
                                                ['qty'],
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 110,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              labelText: "RATE",
                                              fillColor: Colors.white70,
                                              filled: true,
                                              border: OutlineInputBorder(),
                                            ),
                                            controller: orderitems[index]
                                                ['rate'],
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 110,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              labelText: "AMT",
                                              fillColor: Colors.white70,
                                              filled: true,
                                              border: OutlineInputBorder(),
                                            ),
                                            controller: orderitems[index]
                                                ['amount'],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        orderitems.add({
                          "itemname": TextEditingController(),
                          "qty": TextEditingController(),
                          "rate": TextEditingController(),
                          "amount": TextEditingController()
                        });
                        if (count < 4) {
                          h = h + 0.9;
                          count++;
                          print("Incremented: $count");
                        } else {
                          count++;
                          print("Incremented: $count");
                        }
                      });
                    },
                    child: Container(
                      // color: Colors.cyan,
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.add_circle,
                            size: 40,
                          ),
                          Text(
                            "ADD NEW LINE",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "TOTAL",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "5000",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 160,
                    child: Text(
                      "REMARKS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 150,
                    width: 400,
                    child: TextField(
                      maxLines: 6,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _remarks,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 160,
                          child: Text(
                            "Expected Delivery Date",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showDatePicker(context),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxS
                            ],
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.grey,
                          ),
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          child: _chosenDateTime == null
                              ? const Text(
                                  "Pick a Date",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  _chosenDateTime.toString().substring(0, 10),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 160,
                          child: Text(
                            "Delivery From",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 145,
                        child: DropdownButton(
                          value: dropdownvalue1,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items1.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orange
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                          onPressed: () {

                          },
                          child: const Text("Place Order", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
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
}
