import 'package:SiBunga/core/app_widget.dart';
import 'package:SiBunga/models/FetchProfile.dart';
import 'package:SiBunga/screens/login_signup/firebase_auth_services.dart';
import 'package:SiBunga/screens/login_signup/login_screen.dart';
import 'package:SiBunga/screens/profil/editprofil_screen.dart';
import 'package:SiBunga/screens/profil/editriwayat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilAnak extends StatefulWidget {
  final String? nama;
  final String? tempatLahir;
  final DateTime? tanggalLahir;
  final int? umur;
  final String? nik;
  final String? jenisKelamin;
  final String? alamat;
  final String? namaIbu;
  final String? namaBapak;
  final String? nomorHp;
  final String? posyandu;
  final String? paud;
  final String? alergi;
  final String? golDarah;

  List<String>? kepala = [];
  List<String>? rambut = [];
  List<String>? mata = [];
  List<String>? hidung = [];
  List<String>? telinga = [];
  List<String>? rggMulut = [];
  List<String>? gigi = [];
  List<String>? bibir = [];
  List<String>? tenggorokan = [];
  List<String>? leher = [];
  List<String>? dada = [];
  List<String>? tangan = [];
  List<String>? alatKlmn = [];

  ProfilAnak({
    this.nama,
    this.tempatLahir,
    this.tanggalLahir,
    this.umur,
    this.nik,
    this.jenisKelamin,
    this.alamat,
    this.namaIbu,
    this.namaBapak,
    this.nomorHp,
    this.posyandu,
    this.paud,
    this.alergi,
    this.golDarah,
    this.kepala,
    this.rambut,
    this.mata,
    this.hidung,
    this.telinga,
    this.rggMulut,
    this.gigi,
    this.bibir,
    this.tenggorokan,
    this.leher,
    this.dada,
    this.tangan,
    this.alatKlmn,
  });
  @override
  State<ProfilAnak> createState() => _ProfilAnakState();
}

class _ProfilAnakState extends State<ProfilAnak> {
  late Future<ModelProfilAnak> ProfileAnakFuture;

  @override
  void initState() {
    super.initState();
    ProfileAnakFuture = fetchProfileAnak();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Anak'),
        backgroundColor: Color(0xFFE29910),
        centerTitle: true,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<ModelProfilAnak>(
          future: ProfileAnakFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              ModelProfilAnak profilAnak = snapshot.data!;

              return Container(
                padding: EdgeInsets.all(16.0),
                color: Color(0xFFFFEDCC),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                          'Nama Anak', profilAnak.nama?.toString() ?? 'kosong'),
                      _buildText('Tempat Lahir',
                          profilAnak.tempatLahir?.toString() ?? 'kosong'),
                      _buildText('Tanggal Lahir',
                          profilAnak.tanggalLahir?.toString() ?? 'kosong'),
                      _buildText('NIK', profilAnak.nik?.toString() ?? 'kosong'),
                      _buildText('Jenis Kelamin',
                          profilAnak.jenisKelamin?.toString() ?? 'kosong'),
                      _buildText(
                          'Alamat', profilAnak.alamat?.toString() ?? 'kosong'),
                      _buildText('Nama Ibu',
                          profilAnak.namaIbu?.toString() ?? 'kosong'),
                      _buildText('Nama Bapak',
                          profilAnak.namaBapak?.toString() ?? 'kosong'),
                      _buildText('Nomor HP',
                          profilAnak.nomorHp?.toString() ?? 'kosong'),
                      _buildText('Posyandu',
                          profilAnak.posyandu?.toString() ?? 'kosong'),
                      _buildText('PAUD/TK/RA',
                          profilAnak.paud?.toString() ?? 'kosong'),
                      Center(
                        child: ElevatedButton(
                          child: Text('Edit Profil'),
                          onPressed: () {
                            // Navigasi ke halaman EditProfilAnak
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilAnak()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE29910),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Sesuaikan dengan keinginan Anda
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Riwayat Kesehatan",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _buildText('Alergi Obat',
                          profilAnak.alergi?.toString() ?? 'kosong'),
                      _buildText('Golongan Darah',
                          profilAnak.golDarah?.toString() ?? 'kosong'),
                      _buildListText('Kepala', profilAnak.kepala),
                      _buildListText('Rambut', profilAnak.rambut),
                      _buildListText('Mata', profilAnak.mata),
                      _buildListText('Hidung', profilAnak.hidung),
                      _buildListText('Telinga', profilAnak.telinga),
                      _buildListText('Rongga Mulut', profilAnak.rggMulut),
                      _buildListText('Gigi', profilAnak.gigi),
                      _buildListText('Bibir dan Lidah', profilAnak.bibir),
                      _buildListText('Tenggorokan', profilAnak.tenggorokan),
                      _buildListText('Leher', profilAnak.leher),
                      _buildListText('Dada', profilAnak.dada),
                      _buildListText(
                          'Tangan & kuku, Kaki & kuku', profilAnak.tangan),
                      _buildListText('Alat Kelamin', profilAnak.alatKlmn),
                      Center(
                        child: ElevatedButton(
                          child: Text(' Edit Riwayat Kesehatan'),
                          onPressed: () {
                            // Navigasi ke halaman EditProfilAnak
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditRiwayat()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE29910),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Sesuaikan dengan keinginan Anda
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Navigasi ke halaman Dashboard atau halaman lain yang diinginkan
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AppWidget()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE29910),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Sesuaikan dengan keinginan Anda
                ),
              ),
              icon: const Icon(Icons.arrow_left),
              label: Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {
                signOut();
                // Optionally navigate to a different screen after sign-out
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Keluarkan Akun'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE29910),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Sesuaikan dengan keinginan Anda
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListText(String label, List<String> values) {
    String value = values.isNotEmpty ? values.join(', ') : 'kosong';
    print('Value for $label: $value');

    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 255, 255, 255),
          // borderRadius: BorderRadius.circular(8.0),
          border: Border(
            bottom: BorderSide(
              color: Color.fromARGB(
                  255, 69, 69, 69), // Ganti dengan warna border yang diinginkan
              width: 1.0, // Ganti dengan ketebalan border yang diinginkan
              style:
                  BorderStyle.solid, // Ganti dengan gaya border yang diinginkan
            ),
          ),
        ),
        padding: EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              child: Text('$label:', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(value, style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String label, String value) {
    print('Value for $label: $value');

    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 255, 255, 255),
          // borderRadius: BorderRadius.circular(8.0),
          border: Border(
            bottom: BorderSide(
              color: Color.fromARGB(
                  255, 69, 69, 69), // Ganti dengan warna border yang diinginkan
              width: 1.0, // Ganti dengan ketebalan border yang diinginkan
              style:
                  BorderStyle.solid, // Ganti dengan gaya border yang diinginkan
            ),
          ),
        ),
        padding: EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              child: Text('$label:', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                label == 'Tanggal Lahir'
                    ? _formatDate(value) // Format only 'Tanggal Lahir'
                    : value?.isNotEmpty == true
                        ? value
                        : 'kosong',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String? date) {
    if (date == null || date.toLowerCase() == 'kosong') {
      return 'kosong';
    }

    try {
      DateTime parsedDate = DateTime.parse(date);
      String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
      return formattedDate;
    } catch (e) {
      // Handle the case where date parsing fails
      print('Error parsing date: $date');
      return 'kosong'; // Use a default value or handle it based on your requirements
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
