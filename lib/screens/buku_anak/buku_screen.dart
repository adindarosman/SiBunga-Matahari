import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/screens/artikel/artikel_screen.dart';
import 'package:SiBunga/screens/buku_anak/12bulan_screen.dart';
import 'package:SiBunga/screens/buku_anak/18bulan_screen.dart';
import 'package:SiBunga/screens/buku_anak/24bulan_screen.dart';
import 'package:SiBunga/screens/buku_anak/2tahun_screen.dart';
import 'package:SiBunga/screens/buku_anak/3bulan_screen.dart';
import 'package:SiBunga/screens/buku_anak/3tahun_screen.dart';
import 'package:SiBunga/screens/buku_anak/4tahun_screen.dart';
import 'package:SiBunga/screens/buku_anak/5tahun_screen.dart';
import 'package:SiBunga/screens/buku_anak/6bulan_screen.dart';
import 'package:SiBunga/screens/buku_anak/9bulan_screen.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_12bulan.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_18bulan.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_24bulan.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_2tahun.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_3bulan.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_3tahun.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_4tahun.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_5tahun.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_6bulan.dart';
import 'package:SiBunga/screens/buku_anak/buku_hasil/hasil_9bulan.dart';

import 'package:SiBunga/screens/konsultasi/konsultasi_screen.dart';
import 'package:SiBunga/screens/profil/profil_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BukuScreen extends StatefulWidget {
  final DateTime? inputTime;
  final String? formTitle;
  List<Map<String, dynamic>>? questions;
  final List<bool?>? selectedValues;

  BukuScreen({
    this.inputTime,
    this.formTitle,
    this.questions,
    this.selectedValues,
  });
  @override
  _BukuScreenState createState() => _BukuScreenState();
}

class _BukuScreenState extends State<BukuScreen> {
  String selectedAge = "Usia 29 Hari - 3 Bulan"; // Default selected age

  @override
  // void initState() {
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pemantauan Perkembangan Anak',
                style: TextStyle(fontSize: 18),
              ),
              // Text(
              //   'Subtitle Here', // Replace with your desired subtitle
              //   style: TextStyle(fontSize: 12),
              // ),
            ],
          ),
          backgroundColor: Color(0xFFE29910),
          centerTitle:
              true, // Set to false to align the title and subtitle to the start
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.0),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: Colors.grey,
                        width: 0.5), // Add this line for a thin line
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Silahkan pilih formulir di bawah ini sesuai umur anak',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                        softWrap: true,
                      ),
                      Row(
                        children: [
                          DropdownButton<String>(
                            value: selectedAge,
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedAge = newValue;
                                });
                              }
                            },
                            items: [
                              "Usia 29 Hari - 3 Bulan",
                              "Usia 3 - 6 Bulan",
                              "Usia 6 - 9 Bulan",
                              "Usia 9 - 12 Bulan",
                              "Usia 12 - 18 Bulan",
                              "Usia 18 - 24 Bulan",
                              "Usia 24 - 36 Bulan",
                              "Usia 36 - 48 Bulan",
                              "Usia 48 - 60 Bulan",
                              "Usia 60 - 72 Bulan",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(width: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              if (selectedAge == "Usia 29 Hari - 3 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => maksTigaBlnBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 3 - 6 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => maksEnamBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 6 - 9 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => enamkeSembilanBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 9 - 12 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        sembilankeDuablsBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 12 - 18 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => delapanBelasBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 18 - 24 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => duaempatBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 24 - 36 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => duatahunBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 36 - 48 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => tigaTahunBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 48 - 60 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => empatTahunBuku(),
                                  ),
                                );
                              } else if (selectedAge == "Usia 60 - 72 Bulan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => enamTahunBuku(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 255, 184,
                                    30) // Warna latar belakang tombol
                                ),
                            child: Text("Pilih"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hasil Pemantauan Perkembangan Anak',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              hasil_3Bulan(),
              hasil_6Bulan(),
              hasil_9Bulan(),
              hasil_12Bulan(),
              hasil_18Bulan(),
              hasil_24Bulan(),
              hasil_2Tahun(),
              hasil_3Tahun(),
              hasil_4Tahun(),
              hasil_5Tahun(),
            ],
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
                      icon: const Icon(Icons.book),
                      color: Colors.white,
                      onPressed: () {},
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
        ));
  }
}
