import 'package:flutter/material.dart';
class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();
  double? result;

  void calculate(String operation) {
    double num1 = double.tryParse(number1Controller.text) ?? 0;
    double num2 = double.tryParse(number2Controller.text) ?? 0;

    setState(() {
      if (operation == '+') {
        result = num1 + num2;
      } else if (operation == '-') {
        result = num1 - num2;
      } else if (operation == '×') {
        result = num1 * num2;
      } else if (operation == '÷') {
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          result = null;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70),
                  ),
                ),
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  result != null ? "$result" : "",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  controller: number1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter first number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  controller: number2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter second number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () => calculate('+'),
                    child: Text('+', style: TextStyle(fontSize: 25)),
                  ),
                  FloatingActionButton(
                    onPressed: () => calculate('-'),
                    child: Text('-', style: TextStyle(fontSize: 25)),
                  ),
                  FloatingActionButton(
                    onPressed: () => calculate('×'),
                    child: Text('×', style: TextStyle(fontSize: 25)),
                  ),
                  FloatingActionButton(
                    onPressed: () => calculate('÷'),
                    child: Text('÷', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      )),
                  height: 400,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}