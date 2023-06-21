// import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'my-globals.dart' as globals;

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
  List<String> types = ['Type 1', 'Type 2', 'Type 3'];
  List<String> banks = [
    'Select a bank',
    'SBI',
    'TMB',
    'FEDERAL',
    'AXIS',
    'ICICI'
  ];
  List<String> ifsc = [
    'Select a IFSC',
    '12345',
    '12346',
    '12347',
    '12348',
    '12349'
  ];
  List<String> branches = [
    'Select a branch',
    'Bangalore',
    'Chennai',
    'Madurai',
    'Kochi',
    'Hyderabad'
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 6,
                  width: width * 25,
                  child: Text(
                    "Customer ID",
                    style: TextStyle(
                      fontSize: width * 4.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 6,
                  width: width * 50,
                  child: TextField(
                      onEditingComplete: () {
                        setState(() {
                          globals.id = _customerid.text;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Customer ID',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customerid),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 6,
                  width: width * 25,
                  child: Text(
                    "Customer Type",
                    style: TextStyle(
                        fontSize: width * 4.5,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: height * 6,
                  width: width * 50,
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
                        globals.type = selectedValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 35,
              child: Text(
                "Primary Contact",
                style: TextStyle(
                  fontSize: width * 4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 6,
                  width: width * 41,
                  child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _firstname),
                ),
                SizedBox(
                  height: height * 6,
                  width: width * 41,
                  child: TextField(
                      onEditingComplete: () {
                        setState(() {
                          globals.pc = '${_firstname.text} ${_lastname.text}';
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _lastname),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 35,
              child: Text(
                "Company Name",
                style: TextStyle(
                  fontSize: width * 4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height * 6,
                  width: width * 60,
                  child: TextField(
                      onEditingComplete: () {
                        setState(() {
                          globals.cmpname = _customercn.text;
                        });
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customercn),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 37,
              child: Text(
                "Customer Display Name",
                style: TextStyle(
                  fontSize: width * 4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: height * 6,
                  width: width * 60,
                  child: TextField(
                      onEditingComplete: () {
                        setState(() {
                          globals.cdname = _customerdn.text;
                        });
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customerdn),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 37,
              child: Text(
                "Customer Ph",
                style: TextStyle(
                  fontSize: width * 4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: height * 6,
                  width: width * 60,
                  child: TextField(
                      keyboardType: TextInputType.phone,
                      onEditingComplete: () {
                        setState(() {
                          globals.cph = _customerph.text;
                        });
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customerph),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 35,
                  child: Text(
                    "GST IN",
                    style: TextStyle(
                      fontSize: width * 4.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 6,
                  width: width * 47,
                  child: TextField(
                      onEditingComplete: () {
                        setState(() {
                          globals.gst = _customergst.text;
                        });
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _customergst),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 37,
                  child: Text(
                    "Bank Name",
                    style: TextStyle(
                        fontSize: width * 4.5,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: height * 6,
                  width: width * 40,
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
                        globals.bname = selectedValue1;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 35,
                  child: Text(
                    "ACCOUNT NO",
                    style: TextStyle(
                      fontSize: width * 4.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 6,
                  width: width * 47,
                  child: TextField(
                      onEditingComplete: () {
                        setState(() {
                          globals.accno = _accntno.text;
                        });
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _accntno),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 37,
                  child: Text(
                    "IFSC CODE",
                    style: TextStyle(
                        fontSize: width * 4.5,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                Container(
                  height: height * 6,
                  width: width * 40,
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
                        globals.ifsc = selectedValue2;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 37,
                  child: Text(
                    "BRANCH NAME",
                    style: TextStyle(
                        fontSize: width * 4.5,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: height * 6,
                  width: width * 40,
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
                        globals.brname = selectedValue3;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 35,
                  child: Text(
                    "PAN NO",
                    style: TextStyle(
                      fontSize: width * 4.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 6,
                  width: width * 47,
                  child: TextField(
                      onEditingComplete: () {
                        setState(() {
                          globals.pan = _panno.text;
                        });
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _panno),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
