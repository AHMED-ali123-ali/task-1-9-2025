
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:navation_bar/pmi/pmiw2.dart';

double height = 180;
int weight = 80;
int age = 20;
bool isMaleSelected = false;
bool isFemaleSelected = false;

String classBmi() {
  double bmi = weight / pow(height / 100, 2);

  if (bmi < 18.5) {
    return "Underweight (BMI: ${bmi.toStringAsFixed(1)})\n"
        "حاول تزود وزنك بأكل صحي متوازن وزود البروتينات.";
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    return "Normal weight (BMI: ${bmi.toStringAsFixed(1)})\n"
        "ممتاز! استمر على نمط الحياة الصحي وحافظ على وزنك.";
  } else if (bmi >= 25 && bmi <= 29.9) {
    return "Overweight (BMI: ${bmi.toStringAsFixed(1)})\n"
        "ابدأ تقلل سعرات حرارية وتزود النشاط البدني.";
  } else if (bmi >= 30 && bmi <= 34.9) {
    return "Obesity Class I (BMI: ${bmi.toStringAsFixed(1)})\n"
        "خلي بالك! محتاج تنظم أكلك وتتحرك أكتر عشان وزنك ينزل.";
  } else if (bmi >= 35 && bmi <= 39.9) {
    return "Obesity Class II (BMI: ${bmi.toStringAsFixed(1)})\n"
        "وزنك عالي جدًا، مهم تبدأ خطة علاجية مع دكتور وتغير أسلوب حياتك.";
  } else {
    return "Obesity Class III (Severe) (BMI: ${bmi.toStringAsFixed(1)})\n"
        "خطر كبير على صحتك! لازم تستشير دكتور فورًا وتبدأ برنامج إنقاص وزن.";
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 30, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMaleSelected = true;
                          isFemaleSelected = false;
                        });
                      },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: isMaleSelected ? Colors.blue : const Color(0xFF1D1E33),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFemaleSelected = true;
                          isMaleSelected = false;
                        });
                      },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: isFemaleSelected ? Colors.pinkAccent : const Color(0xFF1D1E33),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 160,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${height.toInt()} cm',
                    style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 250,
                    divisions: 150,
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF1D1E33),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          '$weight',
                          style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white),
                              iconSize: 40,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              iconSize: 40,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF1D1E33),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          '$age',
                          style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white),
                              iconSize: 40,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              iconSize: 40,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    String result = classBmi();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BmiResult(result: result),
                      ),
                    );
                  },
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}