import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sales/FRONTEND/Collections/Collection_Details.dart';
import 'package:sales/FRONTEND/Collections/NewCollection.dart';

class Collections extends StatefulWidget {
  const Collections({Key? key}) : super(key: key);

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {


  List data2 = [
    {
      "customername": "Venkat Raman S P",
      "days": "10",
      "rs": "10000"
    },
    {
      "customername": "Venkat S P",
      "days": "12",
      "rs": "50000"
    }
  ];
  List data1 = [
    {
      "customername": "Venkat Raman S P",
      "days": "35",
      "rs": "1000"
    },
  ];
  List data = [
    {
      "customername": "Venkat Raman S P",
      "days": "120",
      "rs": "200000"
    },
  ];


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
                  ExpandablePanel(
                    header: Container(
                      color: Colors.white,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("More than 60 Days",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.circle,color: Colors.green,size: 30,)
                          ],
                        ),
                      ),
                    ),
                    collapsed: const Text(
                      "",
                      softWrap: true,
                      maxLines: 1,
                    ),
                    expanded: CList(context, data, Color(0xffB6E2D3), Colors.green),
                    theme: const ExpandableThemeData(hasIcon: false),
                  ),
                  ExpandablePanel(
                    header: Container(
                      color: Colors.white,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("More than 30 Days",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.circle,color: Colors.orange,size: 30,)
                          ],
                        ),
                      ),
                    ),
                    collapsed: const Text(
                      "",
                      softWrap: true,
                      maxLines: 1,
                    ),
                    expanded: CList(context, data1, Color(0xffFBC490), Colors.orange),
                    theme: const ExpandableThemeData(hasIcon: false),
                  ),
                  ExpandablePanel(
                    header: Container(
                      color: Colors.white,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Less than 15 Days",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.circle,color: Colors.red,size: 30,)
                          ],
                        ),
                      ),
                    ),
                    collapsed: const Text(
                      "",
                      softWrap: true,
                      maxLines: 1,
                    ),
                    expanded: CList(context, data2, Color(0xffF36870),Colors.red),
                    theme: const ExpandableThemeData(hasIcon: false),
                  ),
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
      height: 400,
      child: ListView.builder(
          itemCount: cdata.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
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
                         child: Text(cdata[index]['customername'].toString(),
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
                         child: Text(cdata[index]['days'].toString(),
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
                         child: Text('Rs.${cdata[index]['rs']}',
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
            );
          }
      ),
    );
  }

}
