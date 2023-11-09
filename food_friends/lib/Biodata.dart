import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: BiodataPage(),
    ),
  );
}

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BiodataForm(),
    );
  }
}

class BiodataForm extends StatefulWidget {
  @override
  _BiodataFormState createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  final TextEditingController ageController = TextEditingController();
  String gender = 'Pria';

  void showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Info'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Gambar di atas
          Image.asset(
            'assets/bg.jpg', // Ganti dengan path gambar Anda
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),

          // Input untuk umur
          TextField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Umur',
            ),
          ),
          SizedBox(height: 16),

          // Input untuk jenis kelamin
          DropdownButtonFormField(
            value: gender,
            items: ['Pria', 'Wanita'].map((gender) {
              return DropdownMenuItem(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: (selectedGender) {
              setState(() {
                gender = selectedGender.toString();
              });
            },
            decoration: InputDecoration(
              labelText: 'Jenis Kelamin',
            ),
          ),
          SizedBox(height: 36),

          // Tombol "Selesai"
          ElevatedButton(
            onPressed: () {
              String age = ageController.text;

              if (age.isEmpty || gender.isEmpty) {
                showAlertDialog('All data must be filled in.');
              } else {
                // Simpan data atau lakukan tindakan lain sesuai kebutuhan
                // Di sini, kita hanya menampilkan pesan "Data telah disimpan"
                showAlertDialog('Data has been saved');
              }
            },
            child: Text('Selesai'),
          ),
        ],
      ),
    );
  }
}
