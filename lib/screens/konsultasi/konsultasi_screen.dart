import 'package:SiBunga/core/app_colors.dart';
import 'package:SiBunga/core/app_widget.dart';
import 'package:SiBunga/screens/artikel/artikel_screen.dart';
import 'package:SiBunga/screens/buku_anak/buku_screen.dart';

import 'package:flutter/material.dart';

class KonsultasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Konsultasi'),
          backgroundColor: Color(0xFFE29910),
          centerTitle: true,
          // leading: null,
          // automaticallyImplyLeading: false,
        ),
        body: Container(
          color: Color(0xFFFFEDCC),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                "Sehubungan dengan pelayanan yang kami berikan, apabila Anda memerlukan bantuan atau informasi lebih lanjut, silahkan untuk mengunjungi Unit Pelayanan SDIDTK di Lantai 2 Puskesmas Menteng.\n\nHubungi kami melalui nomor HP: 085779580000 untuk mendapatkan bantuan langsung.\nPendaftaran jam praktek kami adalah setiap Senin hingga Kamis, pukul 07.30-13.30 WIB, dan pada hari Jumat, pukul 07.30-14.00 WIB.\n\nTerima kasih atas perhatian dan kerjasama Anda. Kami siap membantu Anda dengan layanan terbaik.",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
        //bottom navigator bar
        bottomNavigationBar: Container(
          height: 70, // Sesuaikan dengan tinggi yang diinginkan
          color: AppColors
              .secondaryColor, // Sesuaikan dengan warna latar belakang yang diinginkan
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.home_outlined),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => AppWidget()),
                        );
                      },
                    ),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.book_outlined),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BukuScreen()),
                        );
                      },
                    ),
                    Text(
                      'Perkembangan',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.article_outlined),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleScreen()),
                        );
                      },
                    ),
                    Text(
                      'Artikel',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chat_bubble),
                      color: Colors.white,
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => KonsultasiScreen()),
                        // );
                      },
                    ),
                    Text(
                      'Konsultasi',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
