import 'package:flutter/material.dart';
// import 'package:im_stepper/stepper.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List Mon = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  List time = [];
  List<Icon> Icons1 = [];
  List<TextEditingController> _controllers = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width / 100;
    var height = size.height / 100;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
           if(count==0){
               _controllers.add(TextEditingController());
               time.add(DateTime.now().toString().substring(11,16));
               print("Text: ${_controllers[_controllers.length-1].text}");
               count++;
           }
           else{
             if(_controllers[_controllers.length-1].text.isEmpty){
               const snackBar = SnackBar(content: Text('Please enter some value'));
               setState(() {
                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
               });
             }
             else{
               _controllers.add(TextEditingController());
               time.add(DateTime.now().toString().substring(11,16));
             }
           }
          });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 50,
              color: Colors.grey,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DateTime.now().toString().substring(8, 10),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      Mon[int.parse(DateTime.now().toString().substring(5, 7))],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                time.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        height: height * 80,
                        width: width * 100,
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 200,
                            ),
                            Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
                              size: 120,
                            ),
                            Text(
                              "No Activities started",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    : Container(
                      height: 700,
                      width: 427,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: time.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.cyan,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                  Column(
                                    children: [
                                      Padding(
                                              padding: const EdgeInsets.all(14.0),
                                              child: Text(time[index], style: TextStyle(fontSize: 20),),
                                            ),
                                      const Icon(Icons.circle,color: Colors.green,size: 40,)
                                    ],
                                  ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 250,
                                                child: TextField(
                                                  controller: _controllers[index],
                                                  decoration: const InputDecoration(
                                                    fillColor: Colors.white70,
                                                    filled: true,
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Customer Name',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            // color: Colors.green,
                                            width: 250,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(onPressed: (){

                                                }, icon: const Icon(Icons.message_outlined,size: 40,)),
                                                IconButton(onPressed: (){

                                                }, icon: const Icon(Icons.photo,size: 40)),
                                                IconButton(onPressed: (){

                                                }, icon: const Icon(Icons.location_on,size: 40)),
                                                IconButton(onPressed: (){

                                                }, icon: const Icon(Icons.phone,size: 40))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          time.removeAt(index);
                                          _controllers.removeAt(index);
                                          count--;
                                        });
                                      },
                                          icon: const Icon(Icons.remove_circle, color: Colors.red,size: 35,)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
