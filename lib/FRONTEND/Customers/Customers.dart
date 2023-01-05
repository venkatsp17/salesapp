//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales/BACKEND/detailsb.dart';
import 'dart:convert';

import 'package:sales/FRONTEND/Customers/Customer_Details.dart';


class Customers extends StatefulWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {

  final Detailsb c = Detailsb();

  // This list holds the data for the list view
  List _foundUsers = [];
  String choice = "";
  List results = [];
  @override
  void initState() {
    // at the beginning, all users are shown
    fetchCustomerData();
    super.initState();
  }

  fetchCustomerData() async {
    dynamic resultant = await c.getcustomers("Null");
    if(resultant==null){
      print("Unable to retrieve");
    }else{
      setState(() {
        _foundUsers = resultant;
      });

    }
  }
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;
    // This function is called whenever the text field changes
    // Refresh the UI
    setState(() {
      if (choice.isEmpty) {
        // if the search field is empty or only contains white-space, we'll display all users
        results = _foundUsers;
      } else {
        results = _foundUsers
            .where((user) =>
            user["Customer Name"].toLowerCase().contains(choice.toLowerCase()))
            .toList();
        // we use the toLowerCase() method to make it case-insensitive
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Customers",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: height*2,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search Customers',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  labelText: 'Search',
                  suffixIcon: const Icon(Icons.search)),
              onChanged: (value) => {setState(() {choice = value;})},
            ),
            SizedBox(
              height: height*2,
            ),
            Expanded(
              child: results.isNotEmpty
                  ? ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.grey[200],
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Customerdetails(data: results[index],)
                          )
                      );
                    },
                    child: ListTile(
                      leading: Text(
                        results[index]["customerid"].toString(),
                        style: TextStyle(fontSize: width*5.5, fontWeight: FontWeight.bold),
                      ),
                      title: Text(results[index]['companyname'].toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text(
                          'Contact Person Name: ${results[index]["primarycontact"].toString()}'),
                    ),
                  ),
                ),
              )
                  : Text(
                'No results found',
                style: TextStyle(fontSize: width*5.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
