import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final data;
  const Page1({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        disfield(context,"Customer ID", data['customerid']),
        disfield(context,"Customer Type", data['customertype']),
        disfield(context,"Primary contact", data['primarycontact']),
        disfield(context,"Company Name", data['companyname']),
        disfield(context,"Customer Display Name", data['customerdisname']),
        disfield(context,"Customer Ph", data['customerph']),
        disfield(context,"GST IN", data['gstin']),
        disfield(context,"Bank Name", data['bankname']),
        disfield(context,"Account No", data['accountno']),
        disfield(context,"IFSC CODE", data['ifsccode']),
        disfield(context,"Branch Name", data['branch']),
        disfield(context,"Pan No", data['panno']),
      ],
    );
  }

  Widget disfield(BuildContext context, String name, String value){



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
