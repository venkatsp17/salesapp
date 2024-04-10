import 'package:flutter/material.dart';
import 'package:sales/FRONTEND/Activity.dart';
import 'package:sales/FRONTEND/Collections/Collection_Details.dart';
import 'package:sales/FRONTEND/Collections/Collections.dart';
import 'package:sales/FRONTEND/Customers/Customers.dart';
import 'package:sales/FRONTEND/Expenses/Expenses.dart';
import 'package:sales/FRONTEND/Orders/Orders.dart';
// import 'package:sales/FRONTEND/Analytics.dart';
import 'package:sales/main.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width / 100;
    // final _widgetOptions = [
    //   const Orders(),
    //   const Collections(),
    //   const Orders(),
    // ];

    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/analytics': (context) => Orders(),
          '/details': (context) => const Collection_details(details: "Nil",),
          '/customerlist': (context) => const Customers(),
          // '/itemlist': (context) => const Collections(),
          // '/leaveapply': (context) => const Orders(),
          '/logout': (context) => const Orders(),
        },
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xffA09191),
            drawer: const Maindrawer(),
            appBar: AppBar(
              bottom: const TabBar(
                indicatorColor: Colors.cyan,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.cyan, width: 3.0)
                ),
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                tabs: [
                  Tab(text: "Orders", icon: Icon(Icons.shopping_cart)),
                  Tab(text: "Collections", icon: Icon(Icons.attach_money_outlined)),
                  // Tab(text: "Expenses", icon: Icon(Icons.minimize_outlined)),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Activity()));
                    },
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      size: 30,
                    ))
              ],
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                'XYZ',
                style: TextStyle(color: Colors.black),
              ),
            ),
            // body: _widgetOptions[_selectedIndex],
            body: const TabBarView(
              children: [
                Orders(),
                Collections(),
                Expenses(),
              ],
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   iconSize: width * 10,
            //   currentIndex: _selectedIndex,
            //   items: const <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.shopping_cart),
            //       label: 'Orders',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.attach_money_outlined),
            //       label: 'Collections',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.minimize_outlined),
            //       label: 'Expenses',
            //     ),
            //   ],
            //   selectedItemColor: Colors.cyan,
            //   onTap: _onItemTapped,
            // ),
          ),
        ),
      );
    });
  }

  // int _selectedIndex = 0;
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
}

class Maindrawer extends StatelessWidget {
  const Maindrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.cyan),
            currentAccountPicture: CircleAvatar(
              radius: 50.0,
              backgroundColor: Color(0xFF778899),
              backgroundImage: NetworkImage(
                  "https://www.pinkvilla.com/imageresize/tom_holland_15.jpg?width=752&format=webp&t=pvorg"),
            ),
            accountEmail: Text(
              "venkatsp2002@gmail.com",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            accountName: Text(
              "VENKAT S P",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Analytics'),
            onTap: () => {Navigator.pushNamed(context, '/analytics')},
          ),
          ListTile(
            leading: const Icon(Icons.storage_outlined),
            title: const Text('Details'),
            onTap: () => {Navigator.pushNamed(context, '/details')},
          ),
          ListTile(
            leading: const Icon(Icons.storage_outlined),
            title: const Text('Customer List'),
            onTap: () => {Navigator.pushNamed(context, '/customerlist')},
          ),
          ListTile(
            leading: const Icon(Icons.storage_outlined),
            title: const Text('Item List'),
            onTap: () => {Navigator.pushNamed(context, '/itemlist')},
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('Leave Apply'),
            onTap: () => {Navigator.pushNamed(context, '/leaveapply')},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          ),
        ],
      ),
    );
  }
}
