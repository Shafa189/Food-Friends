import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BodyFluidsPage(),
    ),
  );
}

class BodyFluidsPage extends StatefulWidget {
  @override
  _BodyFluidsPageState createState() => _BodyFluidsPageState();
}

class _BodyFluidsPageState extends State<BodyFluidsPage> {
  int glassesCount = 0; // Jumlah gelas yang telah diminum
  double totalWater = 0.0; // Total air yang diminum dalam liter
  List<double> weeklyIntake = List.generate(7, (index) => 0.0); // Data air yang diminum dalam seminggu

  double maxBarHeight = 9.0; // Tinggi grafik maksimum yang diinginkan

  void updateTotalWater() {
    setState(() {
      totalWater = glassesCount * 0.3; // Setiap gelas = 0.3 L
    });
  }

  void calculateAverage() {
    List<bool> increaseOrDecrease = [];

    for (int i = 0; i < weeklyIntake.length; i++) {
      increaseOrDecrease.add(weeklyIntake[i] > 0); // Mengecek apakah ada kenaikan atau penurunan harian
    }

    setState(() {
      for (int i = 0; i < weeklyIntake.length; i++) {
        weeklyIntake[i] = increaseOrDecrease[i] ? maxBarHeight : 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Tambahkan fungsi untuk kembali ke halaman sebelumnya
          },
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
            icon: Icon(Icons.fastfood),
            label: 'Foods',
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
        backgroundColor: Colors.blue.shade600, // Warna latar belakang Bottom Navigation Bar (biru)
        elevation: 8, // Tinggi bayangan (shadow) untuk membuat bayangan biru tua
        type: BottomNavigationBarType.fixed,
        // Tambahkan fungsi untuk mengelola perpindahan antar halaman di sini
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text("Water You Drink in a Day", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (glassesCount > 0) {
                        glassesCount--;
                        updateTotalWater();
                      }
                    });
                  },
                ),
                Image.asset(
                  'assets/water.png', // Ganti dengan path gambar yang sesuai
                  width: 30, // Sesuaikan dengan ukuran gambar yang Anda inginkan
                  height: 30,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      glassesCount++;
                      updateTotalWater();
                    });
                  },
                ),
              ],
            ),
            Text(" $glassesCount glasses "),
            Text("Goal: 2.4 L"),
            Text("Total Water Intake: ${totalWater.toStringAsFixed(1)} L"),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 200,
              child: CustomPaint(
                size: Size(300, 200),
                painter: BarChartPainter(weeklyIntake, maxBarHeight),
              ),
            ),
            SizedBox(height: 40),
            Text("Weekly Water Intake"),
            Row(
              children: <Widget>[
                for (int i = 0; i < 7; i++)
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Day ${i + 1}"),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update nilai weeklyIntake saat input berubah
                        weeklyIntake[i] = double.tryParse(value) ?? 0;
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<double> data;
  final double maxBarHeight;

  BarChartPainter(this.data, this.maxBarHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final barWidth = size.width / (data.length * 2);

    // Gambar kotak pembatas
    final borderRect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    canvas.drawRect(borderRect, borderPaint);

    for (int i = 0; i < data.length; i++) {
      final barHeight = (data[i] / maxBarHeight) * size.height; // Scale to fit the canvas height
      final x = (i * 2 + 1) * barWidth;
      final y = size.height - barHeight;
      final rect = Rect.fromPoints(Offset(x - barWidth / 2, size.height), Offset(x + barWidth / 2, y));
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
