import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMIPage(),
    ),
  );
}

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmi = 0.0;

  void calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);

    // Calculate BMI
    if (weight > 0 && height > 0) {
      double bmiResult = weight / ((height / 100) * (height / 100));
      bmiResult = double.parse(bmiResult.toStringAsFixed(2)); // Round to 2 decimal places
      setState(() {
        bmi = bmiResult;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade800,
                Colors.blue.shade400,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Mengubah alignment menjadi center
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  "BMI Calculator",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's calculate your BMI",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Image.asset(
                  'assets/apel doctor.png', // Ganti dengan path gambar Anda
                  height: 125, // Sesuaikan tinggi gambar
                ),
                SizedBox(height: 76),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: EdgeInsets.all(55),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Weight (kg)'),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Height (cm)'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: calculateBMI,
                        child: Text('Calculate BMI'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'BMI: ${bmi.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
