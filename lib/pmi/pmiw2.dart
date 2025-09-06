import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {
  final String result;
  const BmiResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'BMI RESULT',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Your Result',
                style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF1D1E33),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.split('\n')[0],
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    result.split('\n')[1],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            margin: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'RE-CALCULATE',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}