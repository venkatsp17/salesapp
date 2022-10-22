import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 160,
            child: Text(
              "Address Details",
              style: TextStyle(
                fontSize: 20,
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
                      height: 150,
                      width: 300,
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
                      color: Colors.grey,
                      height: 150,
                      width: 300,
                      child: TextField(
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
              const SizedBox(
                width: 90,
                child: Text(
                  "Country State City",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 100,
                  width: 200,
                  child: CSCPicker(
                    flagState: CountryFlag.DISABLE,
                    defaultCountry: DefaultCountry.India,
                    onCountryChanged: (value) {
                      setState(() {
                        country = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        state = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        city = value;
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
                const SizedBox(
                  width: 160,
                  child: Text(
                    "Pincode",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 40,
                  width: 200,
                  child: TextField(
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
