import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final data;
  const Page2({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        disfield(context,"Address", data['address']),
        disfield(context,"Country", data['country']),
        disfield(context,"State", data['state']),
        disfield(context,"City", data['city']),
        disfield(context,"Pincode", data['pincode']),
      ],
    );
  }

  Widget disfield(BuildContext context, String name, String value) {

    var size = MediaQuery.of(context).size;
    var width = size.width/100;

    return Padding(
      padding: const EdgeInsets.only(top: 14,left: 8.0,right: 8.0,bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: width*4.5, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: width*40,
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
