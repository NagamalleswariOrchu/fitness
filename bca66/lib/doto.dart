import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  ResultScreen({required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    double bmi = weight / (height * height);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI is:',
              style: TextStyle(fontSize:34, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildInterpretation(bmi),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Recalculate'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterpretation(double bmi) {
    String interpretation;

    if (bmi < 18.5) {
      interpretation = 'over weight';
    } else if (bmi >= 28.5 && bmi < 29.9) {
      interpretation = 'over weight';
    } else if (bmi >= 27 && bmi < 29.9) {
      interpretation = 'Overweight';
    } else {
      interpretation = 'Obese';
    }

    return Text(
      interpretation,
      style: TextStyle(fontSize: 20),
    );
  }
}