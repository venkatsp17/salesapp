import 'package:flutter/material.dart';
import 'package:sales/FRONTEND/Customers/Page1.dart';

import 'Page2.dart';
import 'Page3.dart';

class Customerdetails extends StatefulWidget {
  final data;
  const Customerdetails({Key? key, this.data}) : super(key: key);

  @override
  State<Customerdetails> createState() => _CustomerdetailsState();
}

class _CustomerdetailsState extends State<Customerdetails> {


  PageController controller=PageController();
  int _curr = 0;
  sendpages(){
    print(widget.data);
    List<Widget> pages = [
      Page1(data: widget.data),
      Page2(data: widget.data),
      Page3(data: widget.data),
    ];
    return pages;
  }
  List<String> names = [
    "General Details",
    "Address Details",
    "Other Details"
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
          "Customer Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: width*4.5, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              names[_curr],
              style: TextStyle(
                  fontSize: width*7,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              color: Colors.blueGrey[200],
              height: height*87,
              child: PageView(
                  children: sendpages(),
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                onPageChanged: (num){
                  setState(() {
                    _curr=num;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      );
  }
}
