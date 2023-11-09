import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: CalculatorPage(),
    ),
  );
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  String operation = 'Tambah';
  double result = 0.0;

  void calculateResult() {
    double num1 = double.tryParse(firstNumberController.text) ?? 0.0;
    double num2 = double.tryParse(secondNumberController.text) ?? 0.0;

    setState(() {
      if (operation == 'Tambah') {
        result = num1 + num2;
      } else if (operation == 'Kurang') {
        result = num1 - num2;
      } else if (operation == 'Bagi') {
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          result = 0.0; // Atur hasil menjadi 0 jika pembaginya adalah 0
        }
      } else if (operation == 'Kali') {
        result = num1 * num2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Masukkan Angka Pertama:'),
            TextField(
              controller: firstNumberController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12),
            Text('Pilih Operasi:'),
            DropdownButtonFormField(
              value: operation,
              items: ['Tambah', 'Kurang', 'Bagi', 'Kali'].map((op) {
                return DropdownMenuItem(
                  value: op,
                  child: Text(op),
                );
              }).toList(),
              onChanged: (selectedOp) {
                setState(() {
                  operation = selectedOp.toString();
                });
              },
            ),
            SizedBox(height: 12),
            Text('Masukkan Angka Kedua:'),
            TextField(
              controller: secondNumberController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                calculateResult();
              },
              child: Text('Hitung'),
            ),
            SizedBox(height: 16),
            Text('Hasil: $result'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Body Fluids',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blueGrey, // Warna item yang dipilih
        unselectedItemColor: Colors.white, // Warna item yang tidak dipilih
        backgroundColor:  Colors.blue.shade600, // Warna latar belakang Bottom Navigation Bar (biru)
        elevation: 8, // Tinggi bayangan (shadow) untuk membuat bayangan biru tua
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
