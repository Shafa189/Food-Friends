import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang gambar
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), // Ganti dengan path gambar Anda
                fit: BoxFit.cover, // Gambar akan mengisi seluruh layar tanpa merusak aspek rasio
              ),
            ),
            width: double.infinity, // Lebar sesuai dengan layar
            height: double.infinity, // Tinggi sesuai dengan layar
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
                // Logo dan tulisan "Food Friends"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    SizedBox(height: 50),
                    Text(
                      'Food Friends',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 300),
                // Tombol "Mulai" dengan gaya dan lebar yang berbeda
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan aksi ketika tombol "Mulai" ditekan di sini
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900], // Warna latar belakang
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // Membuat tombol lonjong
                    ),
                    minimumSize: Size(200, 50), // Lebar dan tinggi tombol
                  ),
                  child: Text(
                    'Mulai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20, // Ukuran font
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
