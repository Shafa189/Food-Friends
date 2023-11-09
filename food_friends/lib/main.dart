import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FAQPage(),
    ),
  );
}

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertanyaan Umum (FAQ) - Food Friends'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FAQList(),
    );
  }
}

class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FAQItem(
          question: 'Apa itu Food Friends?',
          answer:
          'Food Friends adalah sebuah aplikasi diet yang dirancang untuk membantu Anda menjalani gaya hidup sehat. Ini memberikan berbagai fitur seperti menghitung BMI, mengingatkan untuk minum air, artikel tentang makanan sehat, serta menyediakan halaman profil dan beranda yang berguna.',
        ),
        FAQItem(
          question: 'Bagaimana cara menghitung BMI dengan Food Friends?',
          answer:
          'Untuk menghitung BMI (Body Mass Index) Anda, buka aplikasi Food Friends dan pergi ke halaman "Kalkulator BMI." Masukkan berat badan dan tinggi Anda, lalu klik "Hitung BMI." Hasilnya akan memberi Anda gambaran tentang status berat badan Anda.',
        ),
        FAQItem(
          question: 'Apa kegunaan mengingatkan minum air dalam aplikasi ini?',
          answer:
          'Pengingat minum air adalah fitur yang membantu Anda menjaga hidrasi yang cukup sepanjang hari. Air sangat penting untuk kesehatan, dan fitur ini membantu Anda menjaga kebutuhan hidrasi tubuh Anda.',
        ),
        FAQItem(
          question: 'Bagaimana saya bisa menemukan artikel tentang makanan sehat?',
          answer:
          'Artikel tentang makanan sehat dapat ditemukan di halaman "Artikel Makanan Sehat" di aplikasi Food Friends. Di sana Anda akan menemukan berbagai artikel yang memberikan panduan tentang makanan sehat, resep, dan tips nutrisi.',
        ),
        FAQItem(
          question: 'Apa manfaat memiliki profil di Food Friends?',
          answer:
          'Profil di Food Friends membantu Anda melacak perkembangan Anda, mengatur preferensi pribadi, dan menyimpan informasi kesehatan penting Anda. Anda dapat memperbarui informasi Anda, melihat riwayat pencapaian, dan mengatur target kesehatan pribadi Anda.',
        ),
        FAQItem(
          question: 'Bagaimana cara menggunakan beranda di aplikasi ini?',
          answer:
          'Halaman Beranda adalah tempat di mana Anda dapat melihat informasi terkini dan pembaruan penting seputar aplikasi Food Friends. Ini termasuk pemberitahuan, saran makanan, dan ulasan singkat mengenai pencapaian pribadi Anda.',
        ),
        FAQItem(
          question: 'Apakah Food Friends memiliki fitur pelacakan asupan makanan?',
          answer:
          'Saat ini, Food Friends belum memiliki fitur pelacakan asupan makanan. Namun, kami terus mengembangkan aplikasi kami dan berharap untuk menyertakan fitur ini di masa mendatang.',
        ),
        FAQItem(
          question:
          'Bagaimana saya bisa menghubungi tim dukungan pelanggan jika saya memiliki pertanyaan tambahan?',
          answer:
          'Anda dapat menghubungi tim dukungan pelanggan kami melalui halaman "Hubungi Kami" di aplikasi Food Friends. Kami selalu siap membantu Anda dengan pertanyaan dan masalah yang Anda miliki.',
        ),
        FAQItem(
          question: 'Apakah Food Friends tersedia di semua platform?',
          answer:
          'Saat ini, Food Friends tersedia untuk perangkat berbasis iOS dan Android. Anda dapat mengunduh aplikasi ini secara gratis dari toko aplikasi masing-masing.',
        ),
        FAQItem(
          question: 'Bagaimana cara memulai dengan Food Friends?',
          answer:
          'Untuk memulai dengan Food Friends, unduh aplikasi dari toko aplikasi yang sesuai. Daftar akun atau masuk jika Anda sudah memiliki akun, lalu jelajahi berbagai fitur yang kami tawarkan untuk memulai perjalanan diet dan kesehatan Anda.',
        ),
      ],
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
