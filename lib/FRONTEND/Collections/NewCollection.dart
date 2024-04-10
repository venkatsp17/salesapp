import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sales/BACKEND/Collectionsb.dart';

import '../../BACKEND/detailsb.dart';


class Newcollec extends StatefulWidget {
  final details;
  const Newcollec({Key? key, this.details}) : super(key: key);

  @override
  State<Newcollec> createState() => _NewcollecState();
}

class _NewcollecState extends State<Newcollec> {




  final TextEditingController _companyname = TextEditingController();
  final TextEditingController _amt = TextEditingController();
  final TextEditingController _pid = TextEditingController();
  final TextEditingController _remarks = TextEditingController();

  final Detailsb obj = Detailsb();
  final Collectionsb obb = Collectionsb();
  String customerid = '';
  List<String> items1 = ['Cash', 'Cheque', 'Online Payment', 'UPI'];
  String? dropdownvalue1 = "Cash";
  String result = "";

  Validation(TextEditingController c, String v){
    if(v=='')v='*';
    if(c.value.text.isEmpty){
      return v;
    }
    else{
      return null;
    }
  }
  bool checkall(){
    if (_companyname.value.text.isEmpty || _pid.value.text.isEmpty || _amt.value.text.isEmpty) {
      return false;
    }
    else {
      return true;
    }
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
            "New Collection",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: width*4.5, color: Colors.black),
          ),
        ),
        // backgroundColor: const Color(0xffA09191),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 8, right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height*6,
                      width: width*30,
                      child: Text(
                        "Company Name",
                        style: TextStyle(
                            fontSize: width*5,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                        height: height*6,
                        width: width*65,
                        child: TypeAheadField<Customer?>(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                                errorText: Validation(_companyname, 'Select the customer!'),
                                border: const OutlineInputBorder()),
                            controller: _companyname,
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
                              _companyname.text = customer.name;
                            });
                          },
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height*6,
                      width: width*30,
                      child: Text(
                        "Amount Recieved",
                        style: TextStyle(
                            fontSize: width*5,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      width: width*65,
                      height: height*6,
                      child: TextField(
                        controller: _amt,
                        decoration: InputDecoration(
                          errorText: Validation(_amt, 'Enter the amount!'),
                          fillColor: Colors.white70,
                          filled: true,
                          border: const OutlineInputBorder(),
                          labelText: 'Amount',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height*6,
                      width: width*30,
                      child: Text(
                        "Payment Date",
                        style: TextStyle(
                            fontSize: width*5,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
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
                        height: height*6,
                        width: width*50,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height*6,
                      width: width*30,
                      child: Text(
                        "Payment Mode",
                        style: TextStyle(
                          fontSize: width*5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*6,
                      width:width*50,
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height*6,
                      width: width*30,
                      child: Text(
                        "Payment ID",
                        style: TextStyle(
                            fontSize: width*5,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      width: width*65,
                      height: height*6,
                      child: TextField(
                        controller: _pid,
                        decoration: InputDecoration(
                          errorText: Validation(_pid, ''),
                          fillColor: Colors.white70,
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: 'Payment ID',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 160,
                  child: Text(
                    "Remarks",
                    style: TextStyle(
                      fontSize: width*5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey,
                  width: width*80,
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
                child: SizedBox(
                  width: 160,
                  child: Text(
                    "Proof",
                    style: TextStyle(
                      fontSize: width*5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                            dynamic res = await obb.createcollection(_amt.text, _companyname.text, customerid,  _chosenDateTime.toString().substring(0, 10), _pid.text, dropdownvalue1!, _remarks.text);
                            setState(() {
                              result = res;
                            });
                            if(result=="200"){
                              var snackBar = const SnackBar(content: Text('Collection Added'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            else{
                              var snackBar = const SnackBar(content: Text('Error'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                        }
                        else{
                          print("Error");
                        }

                      },
                      child: Text("Add collection", style: TextStyle(fontWeight: FontWeight.bold,fontSize: width*4.5),),
                    ),
                  ),
                ],
              ),
            ],
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
