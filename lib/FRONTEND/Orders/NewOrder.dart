import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sales/BACKEND/Ordersb.dart';
import 'package:sales/FRONTEND/Customers/NewCustomer/NewCustomer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../BACKEND/Productsb.dart';
import '../../BACKEND/detailsb.dart';

class Neworder extends StatefulWidget {
  const Neworder({Key? key}) : super(key: key);

  @override
  State<Neworder> createState() => _NeworderState();
}

class _NeworderState extends State<Neworder> {
  double h = 1.0;
  int count = 1;
  String result = "";
  final Detailsb obj = Detailsb();
  final Productsb ob = Productsb();
  final Ordersb obb = Ordersb();
  final TextEditingController _orderid = TextEditingController();
  final TextEditingController _remarks = TextEditingController();
  final TextEditingController _cmpname = TextEditingController();
  String selectedValue = "";
  String? dropdownvalue = "Cash";
  String? dropdownvalue1 = "Method 12345";
  String? dropdownvalue2 = "5";
  List<String> items = ['Cash', 'Cheque', 'Online Payment', 'UPI'];
  List<String> items1 = ['Method 12345', 'Method 13545', 'Method 45645'];
    List<String> items2 = ['5', '15', '30','40'];
  List orderitems = [
    {
      "stotal" : 0.0,
      "itemname": TextEditingController(),
      "discount": TextEditingController(),
      "discountamt": 0.0,
      "details": [
        {
          "qty": TextEditingController(),
          "rate": TextEditingController(),
          "amount": TextEditingController(),
          "KG": "5"
        }
      ]
    },
  ];
  double dum = 0.0;
  double total = 0.0;
  double dtotal = 0.0;
  String customerid = '';


  List details(){
    List d = [];
    for(int i=0;i<orderitems.length;i++) {
      d.add(
        {
          "stotal" : orderitems[i]['stotal'],
          "itemname": orderitems[i]['itemname'].text,
          "discount": orderitems[i]['discount'].text,
          "discountamt": orderitems[i]['discountamt'],
          "details": []
        },);
      for (int j = 0; j < orderitems[i]['details'].length; j++) {
          d[i]['details'].add({
            "qty": orderitems[i]['details'][j]['qty'].text,
            "rate": orderitems[i]['details'][j]['rate'].text,
            "amount": orderitems[i]['details'][j]['amount'].text,
            "KG": orderitems[i]['details'][j]['KG']
          });
      }
    }
    return d;
  }


  Total(){
   setState(() {
     for(int i=0;i<orderitems.length;i++){
       for(int j=0;j<orderitems[i]['details'].length;j++){
         if(orderitems[i]['details'][j]['amount'].value.text.isEmpty){
           orderitems[i]['details'][j]['amount'].text = '0.0';
           orderitems[i]['details'][j]['qty'].text = '0';
           orderitems[i]['details'][j]['rate'].text = '0.0';
         }
         dum += double.parse(orderitems[i]['details'][j]['amount'].text);
       }
       orderitems[i]['stotal'] = dum;
       dum = 0.0;
     }
     total = 0.0;
     for(int i=0;i<orderitems.length;i++){
         total += orderitems[i]['stotal'];
     }

   });
  }

  Discount(){
    Total();
    setState(() {
      for(int i=0;i<orderitems.length;i++){
        if(orderitems[i]['discount'].value.text.isEmpty){
          orderitems[i]['discount'].text = '0';
        }
        orderitems[i]['discountamt'] = (double.parse(orderitems[i]['discount'].text)/100)*orderitems[i]['stotal'];
      }
      dtotal = 0.0;
      for(int i=0;i<orderitems.length;i++){
        dtotal += orderitems[i]['discountamt'];
      }
    });
  }
  grandtotal(){
    return (total-dtotal-double.parse(roundoff())).toString();
  }
  roundoff(){
    double g = total-dtotal;
    double r = g - g.roundToDouble();
    if(g>g.roundToDouble()){
      return '$r';
    }
    else{
      return '$r';
    }
  }


  Validation(TextEditingController c, String v){
    if(v=='')v='*';
    if(c.value.text.isEmpty){
        return v;
    }
    else{
      return null;
    }
  }
  bool check = true;
  checkitems() {
    for (int i = 0; i < orderitems.length; i++) {
      for(int j=0;j<orderitems[i]['details'].length;j++){
        if (orderitems[i]['itemname'].text.isEmpty ||
            orderitems[i]['details'][j]['qty'].text.isEmpty ||
            orderitems[i]['details'][j]['rate'].text.isEmpty) {
          setState(() {
            check = false;
          });
          break;
        }
      }
    }
  }


  bool checkall(){
    checkitems();
    if (_cmpname.value.text.isEmpty || _orderid.value.text.isEmpty) {
      print("1");
      return false;
    }
    else if (check == false) {
      print("2");
      setState(() {
        check = true;
      });
      return false;
    }
    else {
      return true;
    }
  }



  String calamt(String a, String b){
      return (double.parse(a) * double.parse(b)).toString();
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
                        height: height*6,
                        width: width*44,
                        child: TypeAheadField<Customer?>(
                          textFieldConfiguration: TextFieldConfiguration(
                              decoration: const InputDecoration(
                                // errorText: Validation(_cmpname, 'Select the customer!'),
                                  border: OutlineInputBorder()),
                              controller: _cmpname,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await obj.getcustomers(pattern);
                          },
                          itemBuilder: (context, Customer? suggestion) {
                            final customer = suggestion!;
                            return ListTile(
                              leading: Text((customer.id).toString()),
                              title: Text(customer.name),
                              subtitle: Text(customer.address),
                            );
                          },
                          onSuggestionSelected: (Customer? suggestion) {
                            final customer = suggestion!;
                            setState(() {
                              customerid = (customer.id).toString();
                              _cmpname.text = customer.name;
                            });
                          },
                        )
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
                  height: height*70,
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
                            height: height*35,
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
                                      Container(
                                          height: height*4,
                                          width: width*40,
                                          child: TypeAheadField<Product?>(
                                            textFieldConfiguration: TextFieldConfiguration(
                                                decoration: InputDecoration(
                                                  // errorText: Validation(orderitems[index]['itemname'], 'Select the product!'),
                                                  filled: true,
                                                    fillColor: Colors.white70,
                                                    border: const OutlineInputBorder()),
                                                controller: orderitems[index]['itemname']
                                            ),
                                            suggestionsCallback: (pattern) async {
                                              return await ob.getproducts(pattern);
                                            },
                                            itemBuilder: (context, Product? suggestion) {
                                              final product = suggestion!;
                                              return ListTile(
                                                subtitle: Text(product.ProductId.toString()),
                                                title: Text(product.ProductName),
                                              );
                                            },
                                            onSuggestionSelected: (Product? suggestion) {
                                              final product = suggestion!;
                                              orderitems[index]['itemname'].text = product.ProductName;
                                            },
                                          )
                                      ),
                                      SizedBox(
                                        height: height*4,
                                        width: width*20,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white70,
                                            filled: true,
                                            labelText: "%",
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: orderitems[index]
                                          ['discount'],
                                          onEditingComplete: (){
                                            Discount();
                                          },
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if(orderitems.length == 1){

                                              }
                                              else{
                                                orderitems.removeAt(index);
                                                Discount();
                                              }
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
                                                "KG": "5",
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
                                          return Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              children: [
                                                SlidableAction(
                                                  flex: 2,
                                                  onPressed: (BuildContext b){
                                                   setState(() {
                                                    if(orderitems[index]['details'].length==1){

                                                    }
                                                    else{
                                                     setState(() {
                                                       orderitems[index]['details'].removeAt(index1);
                                                     });
                                                      Total();
                                                      Discount();
                                                    }
                                                   });
                                                  },
                                                  foregroundColor: Colors.white,
                                                  icon: Icons.delete,
                                                  backgroundColor: Colors.red,
                                                  label: 'Delete',
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(1.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  // Container(
                                                  //   color: Colors.yellow,
                                                  //   height: height*5,
                                                  //   width: width*20,
                                                  //   child: TextField(
                                                  //     decoration: const InputDecoration(
                                                  //       fillColor: Colors.white70,
                                                  //       labelText: "KG",
                                                  //       filled: true,
                                                  //       border: OutlineInputBorder(),
                                                  //     ),
                                                  //     controller: orderitems[index]
                                                  //     ['details'][index1]['KG'],
                                                  //   ),
                                                  // ),
                                                  SizedBox(
                                                    height: height*5,
                                                    width: width*20,
                                                    child: DropdownButtonFormField(
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: Colors.white70,
                                                        enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                          borderSide: const BorderSide(width: 1)
                                                        )
                                                      ),
                                                      isExpanded: true,
                                                      value: orderitems[index]['details'][index1]['KG'].toString(),
                                                      icon: const Icon(Icons.keyboard_arrow_down),
                                                      items: items2.map((String item) {
                                                        return DropdownMenuItem(
                                                          value: item,
                                                          child: Text(item,style: TextStyle(fontSize: width*3),),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          orderitems[index]['details'][index1]['KG'] = newValue;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height*5,
                                                    width: width*20,
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                        fillColor: Colors.white70,
                                                        labelText: "QTY",
                                                        // errorText: Validation(orderitems[index]
                                                        // ['details'][index1]['qty'], ''),
                                                        filled: true,
                                                        border: OutlineInputBorder(),
                                                      ),
                                                      onEditingComplete: (){
                                                        setState(() {
                                                          orderitems[index]
                                                          ['details'][index1]['amount'].text = calamt(orderitems[index]
                                                          ['details'][index1]['qty'].text,orderitems[index]
                                                          ['details'][index1]['rate'].text);
                                                        });
                                                        Total();
                                                        if(orderitems[index]['discount'].text.isEmpty){

                                                        }
                                                        else{
                                                          Discount();
                                                        }
                                                      },
                                                      controller: orderitems[index]
                                                      ['details'][index1]['qty'],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height*5,
                                                    width: width*20,
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                        labelText: "RATE",
                                                        fillColor: Colors.white70,
                                                        filled: true,
                                                        // errorText: Validation(orderitems[index]
                                                        // ['details'][index1]['rate'], ''),
                                                        border: const OutlineInputBorder(),
                                                      ),
                                                      onEditingComplete: (){
                                                        setState(() {
                                                          orderitems[index]
                                                          ['details'][index1]['amount'].text = calamt(orderitems[index]
                                                          ['details'][index1]['qty'].text,orderitems[index]
                                                          ['details'][index1]['rate'].text);
                                                        });
                                                        Total();
                                                        if(orderitems[index]['discount'].text.isEmpty){

                                                        }
                                                        else{
                                                          Discount();
                                                        }
                                                      },
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
                                                        // errorText: Validation(orderitems[index]
                                                        // ['details'][index1]['amount'], ''),
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
                                            ),
                                          );
                                        }
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: height*3.5,
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
                                              orderitems[index]['stotal'].toString(),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      orderitems.add({
                        'stotal': 0.0,
                        "itemname": TextEditingController(),
                        "discount": TextEditingController(),
                        "discountamt": 0.0,
                        "details":[
                          {
                            "KG": "5",
                            "qty": TextEditingController(),
                            "rate": TextEditingController(),
                            "amount": TextEditingController()
                          }
                        ]
                      });
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
                  height: height*16,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TOTAL",
                              style: TextStyle(
                                fontSize: width*4.5,
                              ),
                            ),
                            Text(
                              total.toString(),
                              style: TextStyle(
                                fontSize: width*4.5,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "DISCOUNT AMOUNT",
                              style: TextStyle(
                                fontSize: width*4.5,
                              ),
                            ),
                            Text(
                              '(-)$dtotal',
                              style: TextStyle(
                                fontSize: width*4.5,
                              ),
                            ),
                          ],
                        ),
                        Container(color: Colors.black,width: double.infinity,height: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "",
                              style: TextStyle(
                                fontSize: width*5,
                              ),
                            ),
                            Text(
                              (total-dtotal).toString(),
                              style: TextStyle(
                                fontSize: width*4.5,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ROUND OFF",
                              style: TextStyle(
                                fontSize: width*4.5,
                              ),
                            ),
                            Text(
                              roundoff(),
                              style: TextStyle(
                                fontSize: width*4.5,
                              ),
                            ),
                          ],
                        ),
                        Container(color: Colors.black,width: double.infinity,height: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "GRAND TOTAL",
                              style: TextStyle(
                                fontSize: width*5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              grandtotal(),
                              style: TextStyle(
                                fontSize: width*5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
                        onPressed: () async{
                                if(checkall()){
                                  dynamic res = await obb.createorder(customerid, _orderid.text, _cmpname.text, DateTime.now().toString().substring(0, 10), dropdownvalue1!, grandtotal(), (total-dtotal).toString(), _remarks.text, _chosenDateTime.toString().substring(0, 10), details());
                                  setState(() {
                                    result = res;
                                  });
                                  if(result=="200"){
                                    var snackBar = const SnackBar(content: Text('Order Created'));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                  else{
                                    var snackBar = const SnackBar(content: Text('Error'));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }
                                else{
                                  var snackBar = const SnackBar(content: Text('Error'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  print("Error");
                                }

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
