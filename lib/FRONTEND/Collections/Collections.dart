import 'package:flutter/material.dart';
// import 'package:sales/BACKEND/Ordersb.dart';
import 'package:sales/BACKEND/detailsb.dart';
import 'package:sales/FRONTEND/Collections/Collection_Details.dart';
import 'package:sales/FRONTEND/Collections/NewCollection.dart';

class Collections extends StatefulWidget {
  const Collections({Key? key}) : super(key: key);

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {

  final Detailsb obj = Detailsb();


  @override
  void initState() {
    // TODO: implement initState
    fetchCollectionData();
    super.initState();
  }

  fetchCollectionData() async {
    dynamic resultant = await obj.makeGetRequest();
    if(resultant==null){
      print("Unable to retrieve");
    }else{
       setState(() {
         result = resultant;
         print(result);
       });
      }
    }
    nod(String date){
     List l = date.split('/');
     final date2 = DateTime.now();
     DateTime e = DateTime(int.parse(l[2]),int.parse(l[1]),int.parse(l[0]));
     return date2.difference(e).inDays;
    }
  List result = [];
  String dropdownvalue = "60";
  List<String> items1 = ["15","30","45","60"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 30,bottom: 30),
        child: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const Newcollec()),
            );
          },
          icon: const Icon(Icons.add_circle,size: 70,),
        ),
      ),
      backgroundColor:  const Color(0xffA09191),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                Container(
                color: Colors.white,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("More than",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      DropdownButton(
                        value: dropdownvalue,
                        // icon: const Icon(Icons.keyboard_arrow_down),
                        items: items1.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                      const Text("Days",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const Icon(Icons.circle,color: Colors.green,size: 30,)
                    ],
                  ),
                ),
              ),
                  CList(context, result, Color(0xffB6E2D3), Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget CList(BuildContext context, cdata, Color color,  Color color1){
    return  Container(
      color: color,
      height: 650,
      child: ListView.builder(
          itemCount: cdata.length,
          itemBuilder: (BuildContext context, int index){
            return int.parse(nod(cdata[index]['orderdates'][0].toString()))==int.parse(dropdownvalue)?GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Collection_details(details: cdata[index])));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white70,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         width: 190,
                         alignment: Alignment.center,
                         child: Text(cdata[index]['companyname'].toString(),
                           style: const TextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                       Container(
                         alignment: Alignment.center,
                         width: 80,
                         child: Text(nod(cdata[index]['orderdates'][0].toString()).toString(),
                           style: const TextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                       Container(
                         width: 130,
                         alignment: Alignment.center,
                         child: Text('Rs.${cdata[index]['openingbalance']}',
                           style: const TextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                     ],
                    ),
                  ),
                ),
              ),
            ):const Text("No data available in the range");
          }
      ),
    );
  }

}
