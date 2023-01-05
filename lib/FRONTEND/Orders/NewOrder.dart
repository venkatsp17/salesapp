import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sales/FRONTEND/Customers/NewCustomer/NewCustomer.dart';

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
      "details": [
        {
          "qty": TextEditingController(),
          "rate": TextEditingController(),
          "amount": TextEditingController(),
          "KG": TextEditingController()
        }
      ]
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
          "New Order",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: width*4.5, color: Colors.black),
        ),
      ),
      body: Padding(
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
                    SizedBox(
                      width: width*35,
                      child: Text(
                        "Customer Name",
                        style: TextStyle(
                            fontSize: width*4.5,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width*45,
                      height: height*6,
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
                    SizedBox(
                      height: height*6,
                      child: IconButton(
                        alignment: Alignment.center,
                          onPressed: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const Newcustomer()),
                            );
                      }, icon: const Icon(Icons.add_circle,size: 35,)
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width*20,
                      child: Text(
                        "Order ID",
                        style: TextStyle(
                          fontSize: width*4.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*6,
                      width: width*50,
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
                    SizedBox(
                      width: width*25,
                      child: Text(
                        "Order Date",
                        style: TextStyle(
                          fontSize: width*4.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*6,
                      width: width*50,
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
                    SizedBox(
                      width: width*35,
                      child: Text(
                        "Delivery Method",
                        style: TextStyle(
                          fontSize: width*4.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*6,
                      width: width*50,
                      child: DropdownButton(
                        isExpanded: true,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width*30,
                  child: Text(
                    "ITEM DETAILS",
                    style: TextStyle(
                      fontSize: width*4.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blueGrey[200],
                  height: height*65,
                  child: CupertinoScrollbar(
                    child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: orderitems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                            ),
                            // color: Colors.green,
                            height: height*32,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Item ${index+1}",style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: height*4,
                                        width: width*45,
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
                                              // h = h - 0.9;
                                              // count--;
                                              // print("Decremented: $count");
                                              // if (count == 1) {
                                              //   h = 1.0;
                                              // }
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                            size: 30,
                                          )),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          orderitems[index]['details'].add(
                                              {
                                                "qty": TextEditingController(),
                                                "rate": TextEditingController(),
                                                "amount": TextEditingController()
                                              }
                                          );
                                        });
                                      },
                                          icon: const Icon(Icons.add_circle,color: Colors.green,size: 30,)
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height*20,
                                    child: ListView.builder(
                                      itemCount: orderitems[index]['details'].length,
                                        itemBuilder: (BuildContext context, int index1){
                                          return Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  color: Colors.yellow,
                                                  height: height*5,
                                                  width: width*20,
                                                  child: TextField(
                                                    decoration: const InputDecoration(
                                                      fillColor: Colors.white70,
                                                      labelText: "KG",
                                                      filled: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    controller: orderitems[index]
                                                    ['details'][index1]['KG'],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height*5,
                                                  width: width*20,
                                                  child: TextField(
                                                    decoration: const InputDecoration(
                                                      fillColor: Colors.white70,
                                                      labelText: "QTY",
                                                      filled: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    controller: orderitems[index]
                                                    ['details'][index1]['qty'],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height*5,
                                                  width: width*20,
                                                  child: TextField(
                                                    decoration: const InputDecoration(
                                                      labelText: "RATE",
                                                      fillColor: Colors.white70,
                                                      filled: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    controller:orderitems[index]
                                                    ['details'][index1]['rate'],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height*5,
                                                  width: width*25,
                                                  child: TextField(
                                                    decoration: const InputDecoration(
                                                      labelText: "AMT",
                                                      fillColor: Colors.white70,
                                                      filled: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    controller: orderitems[index]
                                                    ['details'][index1]['amount'],
                                                  ),
                                                ),
                                                // IconButton(onPressed: (){
                                                //     setState(() {
                                                //      if(index1!=0){
                                                //        orderitems[index]['details'].removeAt(index1);
                                                //      }
                                                //     });
                                                // },
                                                //     icon: const Icon(Icons.remove_circle,color: Colors.red,size: 30,)
                                                // )
                                              ],
                                            ),
                                          );
                                        }
                                    ),
                                  )
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
                        "details":[
                          {
                            "qty": TextEditingController(),
                            "rate": TextEditingController(),
                            "amount": TextEditingController()
                          }
                        ]
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
                    alignment: Alignment.centerLeft,
                    height: height*4,
                    width: width*45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          size: 40,
                        ),
                        Text(
                          "ADD NEW LINE",
                          style: TextStyle(
                            fontSize: width*4.5,
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
                  height: height*5,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL",
                          style: TextStyle(
                            fontSize: width*4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "5000",
                          style: TextStyle(
                            fontSize: width*4.5,
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
                child: SizedBox(
                  width: width*25,
                  child: Text(
                    "REMARKS",
                    style: TextStyle(
                      fontSize: width*4.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey,
                  width: width*70,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: width*30,
                        child: Text(
                          "Expected Delivery Date",
                          style: TextStyle(
                            fontSize: width*4.5,
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
                        height: height*5,
                        width: width*40,
                        child: _chosenDateTime == null
                            ? Text(
                                "Pick a Date",
                                style: TextStyle(
                                    fontSize: width*4,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                _chosenDateTime.toString().substring(0, 10),
                                style: TextStyle(
                                    fontSize: width*4,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: width*28,
                        child: Text(
                          "Delivery From",
                          style: TextStyle(
                            fontSize: width*4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*6,
                      width: width*37,
                      child: DropdownButton(
                        isExpanded: true,
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
                    width: width*65,
                    height: height*5,
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
                        child: Text("Place Order", style: TextStyle(fontWeight: FontWeight.bold,fontSize: width*4.5),),
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
