import 'package:flutter/material.dart';
import 'package:sales/FRONTEND/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xffA09191),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height*40,
              width: width*40,
              color: const Color(0xffA09191),
              child: Image.asset('assets/1.png'),
            ),
            // const Text(
            //   "Login",
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
           SizedBox(
              height: height*6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    width: width * 15,
                    height: height * 6,
                    child: Icon(
                      Icons.mail,
                      size: width*7,
                    ),
                  ),
                  SizedBox(
                    height: height*6,
                    width: width*70,
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    width: width * 15,
                    height: height * 6,
                    child: Icon(
                      Icons.key,
                      size: width*7,
                    ),
                  ),
                  SizedBox(
                    height: height*6,
                    width: width * 70,
                    child: TextField(
                      controller: password,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ), //C
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Checkbox(
                    value: remember,
                    onChanged: (bool? value) {
                      setState(() {
                        remember = value!;
                      });
                    },
                  ),
                  const Text("Remember me")
                ],
              ),
            ),
            SizedBox(
              height: height*3.5,
            ),
            SizedBox(
              width: width*50,
              height: height*5,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.cyan
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  )
                ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const Mainscreen()),
                    );
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: width*6,
                      fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
