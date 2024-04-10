import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final data;
  const Page3({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        disfield(context,"Opening Balance", data['TotalPendingAmount']),
        disfield(context,"Payment Terms", data['paymentterms']),
        disfield(context,"Name", data['name']),
        disfield(context,"Mobile No", data['mobileno']),
      ],
    );
  }

  Widget disfield(BuildContext context,String name, String value){

    var size = MediaQuery.of(context).size;
    var width = size.width/100;


    return Padding(
      padding: const EdgeInsets.only(top: 14,left: 8.0,right: 8.0,bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: width*4.5,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(value,
            style: TextStyle(
              fontSize: width*4.5,
            ),
          ),
        ],
      ),
    );
  }
}
