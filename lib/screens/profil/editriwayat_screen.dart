import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:SiBunga/screens/profil/profil_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditRiwayat extends StatefulWidget {
  @override
  _EditRiwayatState createState() => _EditRiwayatState();
}

class _EditRiwayatState extends State<EditRiwayat> {
  List<String> _kepala = [];
  List<String> _rambut = [];
  List<String> _mata = [];
  List<String> _hidung = [];
  List<String> _telinga = [];
  List<String> _rggMulut = [];
  List<String> _gigi = [];
  List<String> _bibir = [];
  List<String> _tenggorokan = [];
  List<String> _leher = [];
  List<String> _dada = [];
  List<String> _tangan = [];
  List<String> _alatKlmn = [];

  Map<String, List<String>> selectedCheckboxValues = {};

  String? _alergi, _golDarah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Riwayat Kesehatan'),
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
              buildRadioGroup('Alergi Obat', ['Ada', 'Tidak'], _alergi),
              buildRadioGroup(
                  'Golongan Darah', ['A', 'B', 'AB', 'O'], _golDarah),
              buildCheckboxGroup(
                  'Kepala',
                  ['Normal', 'Ada benjolan', 'Ada luka', 'Ada bisul/ koreng'],
                  _kepala),
              buildCheckboxGroup('Rambut',
                  ['Normal', 'Kotor', 'Ketombe', 'Ada kutu'], _rambut),
              buildCheckboxGroup(
                  'Mata',
                  [
                    'Normal',
                    'Merah',
                    'Bengkak',
                    'Terasa gatal dan berair',
                    'Nyeri',
                    'Tampak pucat/ anemis pada kelopak mata bawah bagian dalam',
                    'Tampak putih/ katarak pada bola mata bagian hitam',
                    'Tidak dapat melihat/ buta',
                    'Kurang jelas melihat tulisan/ kabur',
                    'Ada benjolan pada kelopak mata atas/ bawah'
                  ],
                  _mata),
              buildCheckboxGroup(
                  'Hidung',
                  [
                    'Normal',
                    'Ada cairan bening keluar dari hidung/ ingus',
                    'Mudah misisan/ berdarah',
                    'Ada benjolan',
                    'Tidak bisa mencium bau',
                    'Kurang bisa mencium bau',
                  ],
                  _hidung),
              buildCheckboxGroup(
                  'Telinga',
                  [
                    'Normal',
                    'Kelainan daun telinga',
                    'Ada benjolan',
                    'Berbau',
                    'Keluar cairan dari lubang telinga',
                    'Nyeri',
                    'Kurang mendengar',
                    'Tidak mendengar',
                    'Ada kotoran tersumbat',
                  ],
                  _telinga),
              buildCheckboxGroup(
                  'Rongga Mulut',
                  [
                    'Normal',
                    'Nafas bau',
                    'Gusi mudah berdarah',
                    'Ada sariawan',
                    'Ada benjolan',
                    'Ada sumbing',
                  ],
                  _rggMulut),
              buildCheckboxGroup(
                  'Gigi',
                  [
                    'Normal',
                    'Ada gigi berlubang',
                    'Nyeri',
                    'Ada gigi patah',
                  ],
                  _gigi),
              buildCheckboxGroup(
                  'Bibir dan Lidah',
                  [
                    'Normal',
                    'Pucat',
                    'Terasa kering dan pecah-pecah',
                    'Ada benjolan',
                    'Ada sumbing',
                  ],
                  _bibir),
              buildCheckboxGroup(
                  'Tenggorokan',
                  [
                    'Normal',
                    'Amandel bengkak',
                    'Nyeri telan',
                    'Suara serak',
                    'Terasa gatal',
                  ],
                  _tenggorokan),
              buildCheckboxGroup(
                  'Leher',
                  [
                    'Normal',
                    'Benjolan',
                    'Ada bercak putih/ panu',
                    'Gatal',
                    'Bengkak',
                  ],
                  _leher),
              buildCheckboxGroup(
                  'Dada',
                  [
                    'Normal',
                    'Ada tarikan dinding dada',
                    'Ada benjolan',
                    'Ada nyeri',
                    'Ada panu/ bercak putih',
                    'Ada luka',
                    'Ada bisul'
                  ],
                  _dada),
              buildCheckboxGroup(
                  'Tangan & Kuku, Kaki & Kuku',
                  [
                    'Normal',
                    'Ada bisul/ koreng',
                    'Ada benjolan',
                    'Ada nyeri',
                    'Ada kudis/ gudig/ skabies',
                  ],
                  _tangan),
              buildCheckboxGroup(
                  'Alat Kelamin',
                  [
                    'Normal',
                    'Ada benjolan',
                    'Ada nyeri',
                    'Ada bengkak',
                  ],
                  _alatKlmn),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFE29910)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    addRiwayat();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilAnak(
                          // alergi: _alergi,
                          // golDarah: _golDarah,
                          kepala: _kepala,
                          rambut: _rambut,
                          mata: _mata,
                          hidung: _hidung,
                          telinga: _telinga,
                          rggMulut: _rggMulut,
                          gigi: _gigi,
                          bibir: _bibir,
                          tenggorokan: _tenggorokan,
                          leher: _leher,
                          dada: _dada,
                          tangan: _tangan,
                          alatKlmn: _alatKlmn,
                        ),
                      ),
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

  Widget buildRadioGroup(
      String title, List<String> values, String? groupValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Row(
          children: values
              .map((value) => buildRadio(title, value, groupValue))
              .toList(),
        ),
      ],
    );
  }

  Widget buildRadio(String groupTitle, String value, String? groupValue) {
    return Row(
      children: [
        Container(
          child: Radio(
            fillColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.black; // Warna ketika dicentang
              } else {
                return Colors.black; // Warna ketika tidak dicentang
              }
            }),
            value: value,
            groupValue: groupValue,
            onChanged: (selectedValue) {
              setState(() {
                if (groupTitle == 'Alergi Obat') {
                  _alergi = value;
                } else if (groupTitle == 'Golongan Darah') {
                  _golDarah = value;
                }
              });
            },
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: groupValue == value ? Colors.black : Colors.black,
          ),
        ),
        SizedBox(width: 5.0),
      ],
    );
  }

  Widget buildCheckboxGroup(
      String title, List<String> options, List<String> groupValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300.0,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: options
              .map(
                  (option) => buildCheckbox(option, options, groupValue, title))
              .toList(),
        ),
      ],
    );
  }

  Widget buildCheckbox(String title, List<String> options,
      List<String> groupValue, String groupTitle) {
    return CheckboxListTile(
      fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.black; // Warna ketika dicentang
        } else {
          return Colors.black; // Warna ketika tidak dicentang
        }
      }),
      title: Text(
        title,
        style: TextStyle(
          color: groupValue.contains(title) ? Colors.black : Colors.black,
        ),
      ),
      value: groupValue.contains(title),
      onChanged: (value) {
        setState(() {
          if (value != null) {
            if (title == 'Normal') {
              if (value) {
                // Jika Normal dipilih
                groupValue.clear();
                groupValue.add('Normal');
              } else {
                // Jika Normal tidak dipilih
                groupValue.clear();
              }
            } else {
              // Jika opsi lain dipilih, atur Normal menjadi false
              groupValue.remove('Normal');
              if (value) {
                // Jika opsi dipilih, tambahkan ke daftar pilihan
                groupValue.add(title);
              } else {
                // Jika opsi tidak dipilih, hapus dari daftar pilihan
                groupValue.remove(title);
              }
            }
          }
          // Update the selected values map
          selectedCheckboxValues[groupTitle] = groupValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Future<void> addRiwayat() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      try {
        Map<String, dynamic> updatedData = {};

        if (_alergi != null) {
          updatedData['alergi'] = _alergi;
        }
        if (_golDarah != null) {
          updatedData['golDarah'] = _golDarah;
        }
        // Add the selected checkbox values to the updatedData map
        updatedData.addAll(selectedCheckboxValues);

        await users.doc(uid).update(updatedData);

        print('User data updated in Firestore');
      } catch (e) {
        print('Error handling data: $e');
      }
    }
  }
}
