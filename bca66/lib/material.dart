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

          title: Text("MicroSoft", style: TextStyle( color: Colors.amberAccent, fontSize: 20),
          ),

        ),



        body:
        Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: GridView(

                children: [
                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange,
                    ),

                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(Icons.home, size: 50, color: Colors.white,),

                          Text("Home", style: TextStyle(color: Colors.yellow, fontSize: 30),),

                        ],
                      ),
                    ),

                  ),

                    Container(


                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.gamepad, size: 50, color: Colors.white,),
                        Text("Gamepad" , style: TextStyle(color: Colors.white, fontSize: 30),)
                      ]
                      ,


                    ),
                  ),

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, size: 50, color: Colors.white,),
                        Text("Facebook" , style: TextStyle(color: Colors.white, fontSize: 30),)
                      ]
                      ,


                    ),
                  ),

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.snapchat, size: 50, color: Colors.white,),
                        Text("Snapchat" , style: TextStyle(color: Colors.white, fontSize: 30),)
                      ]
                      ,


                    ),
                  ),

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.youtube_searched_for, size: 50, color: Colors.white,),
                        Text("Youtube_searched_for" , style: TextStyle(color: Colors.white, fontSize: 30),)
                      ]
                      ,


                    ),
                  ),

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.face_2_rounded, size: 50, color: Colors.white,),
                        Text("faceTime" , style: TextStyle(color: Colors.white, fontSize: 30),)
                      ]
                      ,


                    ),
                  ),

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.settings, size: 50, color: Colors.white,),
                        Text("Settings" , style: TextStyle(color: Colors.white, fontSize: 30),)
                      ]
                      ,


                    ),
                  ),

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellowAccent,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(Icons.account_tree_sharp, size: 50, color: Colors.black,),
                        Text("Connect" , style: TextStyle(color: Colors.black, fontSize: 30),)
                      ]
                      ,


                    ),
                  ),
                ],





                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2
                ),
              ),
            ),
          ),
        )



    );

  }
}