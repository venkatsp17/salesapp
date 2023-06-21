import 'package:flutter/material.dart';
import 'my-globals.dart' as globals;


class stepper3 extends StatefulWidget {
  const stepper3({Key? key}) : super(key: key);

  @override
  State<stepper3> createState() => _stepper3State();
}

class _stepper3State extends State<stepper3> {

  final TextEditingController _openbal = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phno = TextEditingController();

  String selectedValue = "Select Payment method";

  List<String> payments = ['Select Payment method','Cash', 'Online Payment', 'UPI'];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: SizedBox(
            width: width*30,
            child: Text(
              "Other Details",
              style: TextStyle(
                fontSize: width*4.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width*30,
              child: Text(
                "Opening Balance",
                style: TextStyle(
                  fontSize: width*4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height*6,
                width: width*48,
                child: TextField(
                  onEditingComplete: (){
                    setState(() {
                      globals.opb = _openbal.text;
                    });
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  controller: _openbal,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width*30,
              child: Text(
                "Payment Terms",
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
                value: selectedValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: payments.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                    globals.pterms = selectedValue;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 40,),
        SizedBox(
          width: width*35,
          child: Text(
            "Contact Details",
            style: TextStyle(
              fontSize: width*4.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width*20,
              child: Text(
                "Name",
                style: TextStyle(
                  fontSize: width*4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width*50,
                height: height*6,
                child: TextField(
                  onEditingComplete: (){
                    setState(() {
                      globals.name = _name.text;
                    });
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  controller: _name,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width*30,
              child: Text(
                "Mobile No.",
                style: TextStyle(
                  fontSize: width*4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height*6,
                width: width*50,
                child: TextField(
                  onEditingComplete: (){
                    setState(() {
                      globals.mobno = _phno.text;
                    });
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  controller: _phno,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

