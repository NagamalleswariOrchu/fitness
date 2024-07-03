import 'package:flutter/material.dart';
void main()=>runApp(const Calculator());
class Calculator extends StatelessWidget {
  const Calculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeApp()
    );
  }
}
class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => _HomeAppState();
}
class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculator", style: TextStyle(fontSize: 50, color: Colors.purple), ),
      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: GridView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyanAccent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.home_max_rounded, size: 50, color: Colors.white,),
                        Text("cl", style: TextStyle(fontSize: 40, color: Colors.black),)
                      ],
                    ),
                  ) ,//container-1
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyanAccent
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("%",style: TextStyle(color: Colors.black,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyanAccent
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.cable, size: 50,color: Colors.white),
                        Text("ac",style: TextStyle(color: Colors.black,fontSize: 40))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyanAccent
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.access_time, size: 50,color: Colors.black),
                        Text("/",style: TextStyle(color: Colors.black,fontSize: 40))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("1",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("2",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("3",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyanAccent
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("*",style: TextStyle(color: Colors.black,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("4",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("5",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("6",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyanAccent
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("-",style: TextStyle(color: Colors.black,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("7",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("8",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("9",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyanAccent
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("+",style: TextStyle(color: Colors.black,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("00",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("0",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text(".",style: TextStyle(color: Colors.white,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyanAccent
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   Icon(Icons.settings, size: 50,color: Colors.white),
                        Text("=",style: TextStyle(color: Colors.black,fontSize: 40))
                      ],
                    ),
                  ), //container-2
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


