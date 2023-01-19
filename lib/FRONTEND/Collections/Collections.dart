import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  String dropdownvalue = "30";
  List<String> items1 = ["15","30","45","60"];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;


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
      body: result.isEmpty?Center(
        child: LoadingAnimationWidget.hexagonDots(color: Colors.black, size: 50),
      ):Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
              Container(
              color: Colors.white,
              height: height*10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("More than",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width*6,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    DropdownButton(
                      value: dropdownvalue,
                      // icon: const Icon(Icons.keyboard_arrow_down),
                      items: items1.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item,style: TextStyle(fontSize: width*4.5,fontWeight: FontWeight.bold),),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    Text("Days",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width*6,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const Icon(Icons.circle,color: Colors.green,size: 30,)
                  ],
                ),
              ),
            ),
                CList(context, result, const Color(0xffB6E2D3), Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget CList(BuildContext context, cdata, Color color,  Color color1){

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;

    return  SizedBox(
      height: height*68,
      child: ListView.builder(
          itemCount: cdata.length,
          itemBuilder: (BuildContext context, int index){
            return nod(cdata[index]['orderdates'][0].toString())>=int.parse(dropdownvalue)?GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Collection_details(details: cdata[index])));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: Container(
                  height: height*15,
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
                         width: width*30,
                         alignment: Alignment.center,
                         child: Text(cdata[index]['companyname'].toString(),
                           style: TextStyle(
                               color: Colors.black,
                               fontSize: width*4.5,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                       Container(
                         alignment: Alignment.centerRight,
                         width: width*20,
                         child: Text(nod(cdata[index]['orderdates'][0].toString()).toString(),
                           style: TextStyle(
                               color: Colors.black,
                               fontSize: width*4.5,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                       Container(
                         width: width*45,
                         alignment: Alignment.centerRight,
                         child: Text('Rs.${cdata[index]['openingbalance']}',
                           style: TextStyle(
                               color: Colors.black,
                               fontSize: width*4.5,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                     ],
                    ),
                  ),
                ),
              ),
            ):Container();
          }
      ),
    );
  }

}
