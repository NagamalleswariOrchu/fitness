import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _expression = "";

  void _onPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _expression = "";
      } else if (buttonText == "=") {
        _expression = _expression.replaceAll('×', '*');
        _expression = _expression.replaceAll('÷', '/');
        try {
          // Using 'dart:math' for basic arithmetic operations
          // You can use 'math_expressions' package for more complex expressions
          // Add dependency to pubspec.yaml: math_expressions: ^2.2.0
          // import 'package:math_expressions/math_expressions.dart';

          double eval = evalExpression(_expression);
          _output = eval.toString();
        } catch (e) {
          _output = "Error";
        }
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
      _expression += buttonText;
    });
  }

  double evalExpression(String expression) {
    // Evaluate the expression using Dart's 'dart:math' library
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(height: 1.0, color: Colors.black),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildButton(buttons[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return GestureDetector(
      onTap: () => _onPressed(buttonText),
      child: Container(
        decoration: BoxDecoration(
          color: isOperator(buttonText) ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: isOperator(buttonText) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  bool isOperator(String buttonText) {
    return buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷" ||
        buttonText == "=";
  }

  final List<String> buttons = [
    '7', '8', '9', '÷',
    '4', '5', '6', '×',
    '1', '2', '3', '-',
    '0', '.', 'C', '+',
    '=',
  ];
}