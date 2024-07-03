import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meesho',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),


      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {

  int _selectedIndex = 0;

  static const List<Widget> _WidgetOptions  = <Widget>[
    Text(
      'Amozon',
      style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),
    ),

    Text(
      'Flipcart',
      style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),
    ),


    Text(
      'My Account',
      style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3975350688.
    return Scaffold(appBar: AppBar(
      title: Text('Meesho'),
    ),


// Suggested code may be subject to a license. Learn more: ~LicenseLog:3501552997.

      body: Center(
        child: _WidgetOptions.elementAt(_selectedIndex,),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:Icon(Icons.coffee_rounded),
              label: 'Amozon')
// Suggested code may be subject to a license. Learn more: ~LicenseLog:237037959.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1554574495.
          ,
          BottomNavigationBarItem(
              icon:Icon(Icons.shopping_cart_outlined),
              label: 'Flipcart')
          ,
          BottomNavigationBarItem(
              icon:Icon(Icons.person_outline),
              label: 'My Account'),










        ],

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,





      ),









    );







  }
}