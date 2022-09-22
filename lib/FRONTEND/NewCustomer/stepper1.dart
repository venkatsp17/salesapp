// import 'package:dropdown_search/dropdown_search.dart';
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
  final TextEditingController _accntno = TextEditingController();
  final TextEditingController _panno = TextEditingController();
  String selectedValue = "Type 1";
  String selectedValue1 = "Select a bank";
  String selectedValue2 = "Select a IFSC";
  String selectedValue3 = "Select a branch";
  List<String> types = ['Type 1','Type 2','Type 3'];
  List<String> banks = ['Select a bank','SBI','TMB','FEDERAL','AXIS','ICICI'];
  List<String> ifsc = ['Select a IFSC','12345','12346','12347','12348','12349'];
  List<String> branches = ['Select a branch','Bangalore','Chennai','Madurai','Kochi','Hyderabad'];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    "Bank Name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                Container(
                  height: 60,
                  width: 200,
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedValue1,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: banks.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue1 = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 120,
                  child: Text(
                    "ACCOUNT NO",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 220,
                  child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _accntno
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
                    "IFSC CODE",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                Container(
                  height: 60,
                  width: 200,
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedValue2,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: ifsc.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue2 = newValue!;
                      });
                    },
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
                    "BRANCH NAME",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                Container(
                  height: 60,
                  width: 200,
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedValue3,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: branches.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue3 = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 120,
                  child: Text(
                    "PAN NO",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 220,
                  child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _panno
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
