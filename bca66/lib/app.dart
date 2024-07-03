import 'package:flutter/material.dart';

void main() => runApp(ContactScreen());

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Text('ContactUs',
                style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                )),
            SizedBox(height: 20,),
            Text('Name : ',),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your Name'
              ),
            ),

            SizedBox(height: 20,),

            Text('Email : ',),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your Email'
              ),
            ),

            SizedBox(height: 20,),

            Text('qualifications'),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your qualifications'
              ),
            ),

            SizedBox(height: 20,),

            Text('address'),
            SizedBox(height: 10,);
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your address'
              ),
            ),

            SizedBox(height: 20,),

            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your Quries'
              ),
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () {}, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}