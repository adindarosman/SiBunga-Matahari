import 'dart:async';
import 'dart:io';

import 'package:SiBunga/core/app_colors.dart';
import 'package:SiBunga/core/app_pdfs.dart';
import 'package:SiBunga/core/app_widget.dart';
import 'package:SiBunga/screens/buku_anak/buku_screen.dart';
import 'package:SiBunga/screens/konsultasi/konsultasi_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ArticleScreen extends StatefulWidget {
  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String satu = "";
  String dua = "";
  String tiga = "";
  String empat = "";
  String lima = "";
  String enam = "";
  String tujuh = "";
  String delapan = "";
  String sembilan = "";
  String sepuluh = "";
  String sebelas = "";
  String duabelas = "";
  String tigabelas = "";
  String empatbelas = "";
  String jadwal = "";
  String ambang = "";
  String antropometri = "";
  String cewe = "";
  String cowo = "";
  String panduan = "";

  @override
  void initState() {
    super.initState();
    fromAsset('assets/pdfs/Panduan-KIA.pdf', 'Panduan-KIA.pdf').then((f) {
      setState(() {
        panduan = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-1.pdf', 'artikel-1.pdf').then((f) {
      setState(() {
        satu = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-2.pdf', 'artikel-2.pdf').then((f) {
      setState(() {
        dua = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-3.pdf', 'artikel-3.pdf').then((f) {
      setState(() {
        tiga = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-4.pdf', 'artikel-4.pdf').then((f) {
      setState(() {
        empat = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-5.pdf', 'artikel-5.pdf').then((f) {
      setState(() {
        lima = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-6.pdf', 'artikel-6.pdf').then((f) {
      setState(() {
        enam = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-7.pdf', 'artikel-7.pdf').then((f) {
      setState(() {
        tujuh = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-8.pdf', 'artikel-8.pdf').then((f) {
      setState(() {
        delapan = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-9.pdf', 'artikel-9.pdf').then((f) {
      setState(() {
        sembilan = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-10.pdf', 'artikel-10.pdf').then((f) {
      setState(() {
        sepuluh = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-11.pdf', 'artikel-11.pdf').then((f) {
      setState(() {
        sebelas = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-12.pdf', 'artikel-12.pdf').then((f) {
      setState(() {
        duabelas = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-13.pdf', 'artikel-13.pdf').then((f) {
      setState(() {
        tigabelas = f.path;
      });
    });
    fromAsset('assets/pdfs/artikel-14.pdf', 'artikel-14.pdf').then((f) {
      setState(() {
        empatbelas = f.path;
      });
    });
    fromAsset('assets/pdfs/jadwal-imunisasi-2023.pdf',
            'jadwal-imunisasi-2023.pdf')
        .then((f) {
      setState(() {
        jadwal = f.path;
      });
    });
    fromAsset('assets/pdfs/ambang_batas.pdf', 'ambang_batas.pdf').then((f) {
      setState(() {
        ambang = f.path;
      });
    });
    fromAsset('assets/pdfs/tabel_antropometri.pdf', 'tabel_antropometri.pdf')
        .then((f) {
      setState(() {
        antropometri = f.path;
      });
    });
    fromAsset('assets/pdfs/cewe.pdf', 'cewe.pdf').then((f) {
      setState(() {
        cewe = f.path;
      });
    });
    fromAsset('assets/pdfs/cowo.pdf', 'cowo.pdf').then((f) {
      setState(() {
        cowo = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel'),
        backgroundColor: Color(0xFFE29910),
        centerTitle: true,
        // leading: null,
        // automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildArticleItem(
              icon: Icons.article_outlined,
              title:
                  'Buku Saku Panduan Praktis Pelaksanaan Pemantauan dan Intervensi Tumbuh Kembang dengan Buku KIA',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: panduan)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Jadwal Imunisasi 2023',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: jadwal)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Kategori dan Ambang Batas Status Gizi Anak',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: ambang)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Tabel Standar Antropometri Penilaian Status Gizi Anak',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: antropometri)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'KMS Anak Perempuan dan Grafik WHO',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: cewe)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'KMS Anak Laki-laki dan Grafik WHO',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: cowo)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Mengapa Anak Perlu Dipantau Tumbuh Kembang?',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: satu)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Speech Delay',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PDFScreen(path: dua)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Apa Itu Autisme Pada Anak?',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: tiga)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title:
                  'Yuk Kenali Attention Deficit Hyperactivity Disorder (ADHD)',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: empat)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title:
                  'Pemantauan Pertumbuhan dan Perkembangan Anak Usia 0-72 Bulan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: lima)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title:
                  'Pemantauan Perkembangan dengan Pemeriksaan Skrining Perkembangan Anak Usia 0-72 Bulan dengan Buku KIA Secara Mandiri',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: enam)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Gerakan Tutup Mulut (GTM) Pada Bayi dan Balita',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: tujuh)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title:
                  'Bagaimana Caranya Melatih Perilaku Makan yang Benar (Feeding Rules) Pada Anak?',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: delapan)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Apa yang Tidak Boleh Dilakukan Saat Melatih Anak Makan?',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: sembilan)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Tekstur MPASI Sesuai Usia',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: sepuluh)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Pertumbuhan Berat Badan Anak Usia 0-60 Bulan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: sebelas)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title: 'Mengenal dan Mencegah Stunting (Kerdil) Pada Anak',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: duabelas)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title:
                  'Pertumbuhan Panjang atau Tinggi Badan Anak Usia 0-60 Bulan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: tigabelas)),
                );
              },
            ),
            buildDivider(),
            buildArticleItem(
              icon: Icons.article_outlined,
              title:
                  'Tanda Bahaya (Red Flags) Pada Pemantauan Tumbuh Kembang Anak',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFScreen(path: empatbelas)),
                );
              },
            ),
            buildDivider(),
          ],
        ),
      ),

      //bottom nav
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
                    icon: const Icon(Icons.article_outlined),
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
                    icon: const Icon(Icons.article),
                    color: Colors.white,
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ArticleScreen()),
                      // );
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
                    icon: const Icon(Icons.chat_bubble_outline),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KonsultasiScreen()),
                      );
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
      ),
    );
  }
}

Widget buildArticleItem({
  required IconData icon,
  required String title,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xFFE29910),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildDivider() {
  return SizedBox(
    height: 1,
    child: Container(
      color: Colors.black,
    ),
  );
}

void main() {
  runApp(MaterialApp(
    home: ArticleScreen(),
  ));
}
