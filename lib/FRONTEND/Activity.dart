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
        centerTitle: false,
        title: Text(
         "Activities",
          style:TextStyle(
              fontSize: width*4.5, fontWeight: FontWeight.bold,color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: height*5,
            color: Colors.grey,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateTime.now().toString().substring(8, 10),
                    style:TextStyle(
                        fontSize: width*4.5, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                  Mon[int.parse(DateTime.now().toString().substring(5, 7))-1],
                    style: TextStyle(
                        fontSize: width*4.5, fontWeight: FontWeight.bold),
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
                        children: [
                          SizedBox(
                            height: height*20,
                          ),
                          const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.grey,
                            size: 120,
                          ),
                          Text(
                            "No Activities started",
                            style:
                                TextStyle(fontSize: width*4.5, color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  : Container(
                    height: height*70,
                    width: width*100,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: time.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height*14,
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
                                            child: Text(time[index], style: TextStyle(fontSize: width*4.5),),
                                          ),
                                    const Icon(Icons.circle,color: Colors.green,size: 29,)
                                  ],
                                ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: height*6,
                                              width: width*50,
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
                                          width: width*50,
                                          height: height*5,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(onPressed: (){

                                              }, icon: const Icon(Icons.message_outlined,size: 29,)),
                                              IconButton(onPressed: (){

                                              }, icon: const Icon(Icons.photo,size: 29)),
                                              IconButton(onPressed: (){

                                              }, icon: const Icon(Icons.location_on,size: 29)),
                                              IconButton(onPressed: (){

                                              }, icon: const Icon(Icons.phone,size: 29))
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
    );
  }
}
