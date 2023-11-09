import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DietHomePage(),
    ),
  );
}

class DietHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Tambahkan aksi untuk menu setting di sini
            },
          ),
        ],
      ),
      body: DietArticlesGrid(),
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
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue.shade600,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class DietArticlesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      children: [
        DietArticleCard(title: 'Resep Minuman Untuk Menurunkan Berat Badan', image: 'assets/tehkayumanis.jpg'),
        DietArticleCard(title: 'Resep Pancake Pisan Rendah Kalori', image: 'assets/Resep-Pancake-pisang.jpg'),
        DietArticleCard(title: '13 Buah Yang Baik Untuk Jantung', image: 'assets/BuahJantung.jpeg'),
        DietArticleCard(title: '6 Buah Yang Cocok Untuk Menurunkan Berat Badan', image: 'assets/buahdiet.jpg'),
        // Tambahkan lebih banyak DietArticleCard di sini sesuai kebutuhan
      ],
    );
  }
}

class DietArticleCard extends StatelessWidget {
  final String title;
  final String image;

  DietArticleCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
