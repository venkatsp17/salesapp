import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class stepper1 extends StatefulWidget {
  const stepper1({Key? key}) : super(key: key);

  @override
  State<stepper1> createState() => _stepper1State();
}

class _stepper1State extends State<stepper1> {

  final TextEditingController _customerid = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _customercn = TextEditingController();
  final TextEditingController _customerdn = TextEditingController();
  final TextEditingController _customerph = TextEditingController();
  final TextEditingController _customergst = TextEditingController();
  String selectedValue = "Type 1";
  List<String> types = ['Type 1','Type 2','Type 3'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    "Customer ID",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 240,
                  child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Customer ID',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customerid
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    "Customer Type",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                Container(
                  height: 60,
                  width: 145,
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: types.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const SizedBox(
              width: 165,
              child: Text(
                "Primary Contact",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 170,
                  child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _firstname
                  ),
                ),
                Container(
                  height: 60,
                  width: 170,
                  child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _lastname
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const SizedBox(
              width: 165,
              child: Text(
                "Company Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: 250,
                  child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customercn
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const SizedBox(
              width: 165,
              child: Text(
                "Customer Display Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: 250,
                  child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customerdn
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const SizedBox(
              width: 165,
              child: Text(
                "Customer Ph",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: 250,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customerph
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    "GST IN",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customergst
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
