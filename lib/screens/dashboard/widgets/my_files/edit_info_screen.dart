import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:SiBunga/core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class EditInfoScreen extends StatefulWidget {
  @override
  _EditInfoScreenState createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  // Controller untuk mengambil nilai dari TextFormField
  final TextEditingController _beratBadanController = TextEditingController();
  final TextEditingController _tinggiBadanController = TextEditingController();
  final TextEditingController _lingkarKplController = TextEditingController();
  final TextEditingController _lingkarLgnController = TextEditingController();

  // Variabel untuk menyimpan nilai tanggal lahir dan jenis kelamin
  DateTime? dateInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pertumbuhan Anak'),
        // automaticallyImplyLeading: false,
        // leading: null,
        backgroundColor: Color(0xFFE29910),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Color(0xFFFFEDCC),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 125.0, // Sesuaikan dengan lebar yang diinginkan
                    child: Text(
                      'Berat Badan',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Jarak antara label dan TextField
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Warna latar belakang TextField
                        borderRadius:
                            BorderRadius.circular(8.0), // Sudut yang dibulatkan
                      ),
                      child: TextField(
                        controller: _beratBadanController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Berat Badan Anak',
                          hintStyle:
                              TextStyle(color: Colors.grey), // Warna teks hint
                          border:
                              InputBorder.none, // Hapus garis border default
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0), // Padding dalam TextField
                        ),
                        style:
                            TextStyle(color: Colors.grey), // Warna teks input
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 125.0, // Sesuaikan dengan lebar yang diinginkan
                    child: Text(
                      'Tinggi Badan',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Jarak antara label dan TextField
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Warna latar belakang TextField
                        borderRadius:
                            BorderRadius.circular(8.0), // Sudut yang dibulatkan
                      ),
                      child: TextField(
                        controller: _tinggiBadanController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Tinggi Badan Anak',
                          hintStyle:
                              TextStyle(color: Colors.grey), // Warna teks hint
                          border:
                              InputBorder.none, // Hapus garis border default
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0), // Padding dalam TextField
                        ),
                        style:
                            TextStyle(color: Colors.grey), // Warna teks input
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 125.0, // Sesuaikan dengan lebar yang diinginkan
                    child: Text(
                      'Lingkar Kepala',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Jarak antara label dan TextField
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Warna latar belakang TextField
                        borderRadius:
                            BorderRadius.circular(8.0), // Sudut yang dibulatkan
                      ),
                      child: TextField(
                        controller: _lingkarKplController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Lingkar Kepala Anak',
                          hintStyle:
                              TextStyle(color: Colors.grey), // Warna teks hint
                          border:
                              InputBorder.none, // Hapus garis border default
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0), // Padding dalam TextField
                        ),
                        style:
                            TextStyle(color: Colors.grey), // Warna teks input
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 125.0, // Sesuaikan dengan lebar yang diinginkan
                    child: Text(
                      'Lingkar Lengan Atas',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Jarak antara label dan TextField
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Warna latar belakang TextField
                        borderRadius:
                            BorderRadius.circular(8.0), // Sudut yang dibulatkan
                      ),
                      child: TextField(
                        controller: _lingkarLgnController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Lingkar Lengan Atas Anak',
                          hintStyle:
                              TextStyle(color: Colors.grey), // Warna teks hint
                          border:
                              InputBorder.none, // Hapus garis border default
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0), // Padding dalam TextField
                        ),
                        style:
                            TextStyle(color: Colors.grey), // Warna teks input
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFE29910)), // Warna ElevatedButton
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                          horizontal: 100.0,
                          vertical: 10.0), // Lebarkan ukuran button
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Ubah nilai sesuai kebutuhan
                      ),
                    ),
                  ),
                  onPressed: () {
                    addInfo();
                    setState(() {
                      dateInput = DateTime.now();
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AppWidget()),
                    );
                  },
                  child: Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addInfo() async {
    User? user = FirebaseAuth.instance.currentUser;

    String beratBadan = _beratBadanController.text;
    String tinggiBadan = _tinggiBadanController.text;
    String lingkarKpl = _lingkarKplController.text;
    String lingkarLgn = _lingkarLgnController.text;

    if (user != null) {
      String uid = user.uid;
      CollectionReference growthDataCollection =
          FirebaseFirestore.instance.collection('data_pertumbuhan');

      try {
        // Create a document with the current date as ID
        DateTime currentDate = DateTime.now();
        String dateId = currentDate.toLocal().toString();

        Map<String, dynamic> newData = {
          'date': currentDate,
          'beratBadan': beratBadan.isNotEmpty ? double.parse(beratBadan) : null,
          'tinggiBadan':
              tinggiBadan.isNotEmpty ? double.parse(tinggiBadan) : null,
          'lingkarKpl': lingkarKpl.isNotEmpty ? double.parse(lingkarKpl) : null,
          'lingkarLgn': lingkarLgn.isNotEmpty ? double.parse(lingkarLgn) : null,
        };

        // Update the existing document for the user in the 'growth_data' collection
        await growthDataCollection
            .doc(uid)
            .collection('data')
            .doc(dateId)
            .set(newData);

        print('Growth data added to Firestore');
      } catch (e) {
        print('Error handling growth data: $e');
      }
    }
  }
}
