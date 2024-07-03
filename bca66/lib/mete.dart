
import 'package:flutter/material.dart';

void main() => runApp(myApp());


class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '1', '2', '3', '+',
    '4', '5', '6', '-',
    '7', '8', '9', '*',
    '.', '0', 'ANS', '=',
  ];

  String input = '';

  String output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: <Widget>[
          Expanded(child:
          Container(

            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomRight  ,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(output,
                  style: TextStyle(fontSize: 48,color: Colors.white),
                ),
                Container(

                    child: Text(input,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ))
              ],
            ),
          )

          ),

          Expanded(
              flex: 2,
              child: Container(
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount : buttons.length,
                    itemBuilder : (BuildContext context,int index) {
                      return GridButton(
                        onTap: () => handleButtonPress(buttons[index]),)
                    }
                ),
              )


          ),




        ],
      ),

    );
  }



  void handleButtonPress(String buttonText){
    setState(() {
      if(buttonText == 'C' ){
        input = '';
        output = '';
      }else if(buttonText == 'DEL'){
        if(input.isNotEmpty){
          input = input.substring(0,input.length-1);
        }
      }else if(buttonText == '=') {
        try {
          output = calculate(input);
        } catch (e) {
          output = 'ERROR';
        }
      }
      else if(buttonText == 'ANS'){
        input +=output;
      }else{
        input +=buttonText;
      }
    }
        });
}
}


class GridButton extends StatelessWidget {

  final String buttonText;

  final VoidCallback onTap;

  GridButton({required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}