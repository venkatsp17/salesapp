import 'package:flutter/material.dart';

class Paymentdetails extends StatelessWidget {
  final data;
  const Paymentdetails({Key? key, this.data}) : super(key: key);

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
          "Payment Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: width*4.5, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          view(context,"Company Name", data['companyname']),
          view(context,"Amount Recieved", data['amtreceived']),
          view(context,"Payment Date", data['paymentdate']),
          view(context,"Payment Mode", data['paymentmode']),
          view(context,"Payment ID", data['paymentid']),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              color: Colors.grey[200],
              width: double.infinity,
              height: height*40,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data['remarks'],
                    style: TextStyle(
                        fontSize: width*4.5,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget view(BuildContext context, Name, value) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width*40,
            child: Text(
              Name,
              style: TextStyle(
                fontSize: width*4.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: width*50,
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
