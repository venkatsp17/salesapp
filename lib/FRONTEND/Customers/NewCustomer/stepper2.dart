import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'my-globals.dart' as globals;

class stepper2 extends StatefulWidget {
  const stepper2({Key? key}) : super(key: key);

  @override
  State<stepper2> createState() => _stepper2State();
}

class _stepper2State extends State<stepper2> {

  final TextEditingController _address = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  String? country;
  String? city;
  String? state;


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              "Address Details",
              style: TextStyle(
                fontSize: width*4.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
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
                        controller: _address,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width*80,
                      color: Colors.grey,
                      child: TextField(
                        onEditingComplete: (){
                          setState(() {
                            globals.add =  '${_address.text} ${_address1.text}';
                          });
                        },
                        maxLines: 6,
                        decoration: const InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                        controller: _address1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width*28,
                child: Text(
                  "Country State City",
                  style: TextStyle(
                    fontSize: width*4.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: height*15,
                  width: width*45,
                  child: CSCPicker(
                    flagState: CountryFlag.DISABLE,
                    defaultCountry: CscCountry.India,
                    onCountryChanged: (value) {
                      setState(() {
                        country = value;
                        globals.country = country!;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        state = value;
                        globals.state = state!;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        city = value;
                        globals.city = city!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width*20,
                  child: Text(
                    "Pincode",
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
                    onEditingComplete: (){
                      setState(() {
                        globals.pin =  _pincode.text;
                      });
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    controller: _pincode,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
