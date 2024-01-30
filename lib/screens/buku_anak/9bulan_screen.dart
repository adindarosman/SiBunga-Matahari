import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:SiBunga/screens/buku_anak/buku_screen.dart';
import 'package:SiBunga/screens/login_signup/firebase_auth_services.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class enamkeSembilanBuku extends StatefulWidget {
  @override
  _enamkeSembilanBukuState createState() => _enamkeSembilanBukuState();
}

class _enamkeSembilanBukuState extends State<enamkeSembilanBuku> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void initState() {
    super.initState();
    // Example: You can get the user ID when the page initializes
    _getCurrentUserId();
  }

  Future<void> _getCurrentUserId() async {
    String? userId = await _authService.getCurrentUserId();
    if (userId != null) {
      print('User ID: $userId');
    } else {
      print('User not logged in.');
    }
  }

  List<Map<String, dynamic>> questions = [
    {'number': 1, 'question': 'Bayi bisa duduk secara mandiri?'},
    {
      'number': 2,
      'question':
          'Bayi belajar berdiri, kedua kakinya menyangga sebagian berat badan?'
    },
    {
      'number': 3,
      'question': 'Bayi bisa merangkak meraih mainan atau mendekati seseorang?'
    },
    {
      'number': 4,
      'question':
          'Bayi bisa memindahkan benda dari satu tangan ke tangan lainnya?'
    },
    {
      'number': 5,
      'question':
          'Bayi bisa memungut 2 benda, kedua tangan pegang 2 benda pada saat bersamaan?'
    },
    {
      'number': 6,
      'question': 'Bayi bisa memungut benda sebesar kacang dengan cara meraup?'
    },
    {
      'number': 7,
      'question': 'Bayi bersuara tanpa arti, mamama, bababa, dadada, tatatata?'
    },
    {'number': 8, 'question': 'Bayi mencari mainan/benda yang dijatuhkan?'},
    {'number': 9, 'question': 'Bayi bermain tepuk tangan/ciluk ba'},
    {'number': 10, 'question': 'Bayi bergembira dengan melempar benda?'},
    {'number': 11, 'question': 'Bayi makan kue sendiri?'},
  ];
  List<bool?> selectedValues = List.generate(11, (index) => null);
  // Function to get current timestamp
  String getTimestamp() {
    DateTime now = DateTime.now();
    return now.toLocal().toString(); // You can format it as needed
  }

  List<DataRow> _buildRows() {
    List<DataRow> rows = [];
    for (int i = 0; i < questions.length; i++) {
      rows.add(DataRow(
        color: MaterialStateColor.resolveWith(
          (states) {
            return i % 2 == 0
                ? Color.fromARGB(255, 255, 205, 130) ?? Colors.transparent
                : Color.fromARGB(255, 255, 250, 237) ?? Colors.transparent;
          },
        ),
        cells: [
          DataCell(
            Container(
              padding: EdgeInsets.all(3),
              alignment: Alignment.topLeft,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                minHeight: 60.0,
              ),
              child: Text(
                questions[i]['number'].toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          DataCell(
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 3),
              width: 245,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                minHeight: 60.0,
              ),
              child: Text(
                questions[i]['question'],
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          DataCell(
            Container(
              alignment: Alignment.topCenter,
              width: 25,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                minHeight: 60.0,
              ),
              child: Radio(
                value: true,
                groupValue: selectedValues[i],
                onChanged: (value) {
                  setState(() {
                    selectedValues[i] = value as bool?;
                  });
                },
                fillColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.black; // Warna ketika dicentang
                  } else {
                    return Colors.black; // Warna ketika tidak dicentang
                  }
                }),
              ),
            ),
          ), // Jawaban Ya
          DataCell(
            Container(
              alignment: Alignment.topCenter,
              width: 25,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                minHeight: 60.0,
              ),
              child: Radio(
                value: false,
                groupValue: selectedValues[i],
                onChanged: (value) {
                  setState(() {
                    selectedValues[i] = value as bool?;
                  });
                },
                fillColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.black; // Warna ketika dicentang
                  } else {
                    return Colors.black; // Warna ketika tidak dicentang
                  }
                }),
              ),
            ),
          ), // Jawaban Tidak
        ],
      ));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usia 6 - 9 Bulan'),
        backgroundColor: Color(0xFFE29910),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder(), // Specify the bottom border
                  horizontalMargin: 5,
                  columnSpacing: constraints.maxWidth /
                      40, // Sesuaikan dengan jumlah kolom
                  dataRowMaxHeight: constraints.maxHeight,
                  columns: [
                    DataColumn(
                        label:
                            Text('No', style: TextStyle(color: Colors.black))),
                    DataColumn(
                        label: Text('Pertanyaan',
                            style: TextStyle(color: Colors.black))),
                    DataColumn(
                        label:
                            Text('Ya', style: TextStyle(color: Colors.black))),
                    DataColumn(
                        label: Text('Tidak',
                            style: TextStyle(color: Colors.black))),
                  ],
                  rows: _buildRows(),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            saveAnswersToDatabase('Usia 6 - 9 Bulan');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BukuScreen(
                  inputTime: DateTime.now(),
                  formTitle: 'Usia 6 - 9 Bulan',
                  questions: questions,
                  selectedValues: selectedValues,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary:
                const Color.fromARGB(255, 255, 180, 66), // Set warna oranye
          ),
          child: Text("Submit"),
        ),
      ),
    );
  }

  Future<void> saveAnswersToDatabase(String formTitle) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      CollectionReference answersCollection =
          FirebaseFirestore.instance.collection('buku_anak');

      try {
        List<Map<String, dynamic>> userDataList = [];

        for (int i = 0; i < questions.length; i++) {
          Map<String, dynamic> questionData = {
            'number': questions[i]['number'],
            'question': questions[i]['question'],
            'answer': selectedValues[i] ?? false,
          };

          userDataList.add(questionData);
        }
        for (int i = 0; i < questions.length; i++) {
          Map<String, dynamic> userData = {
            'formTitle': formTitle,
            'userId': uid,
            'timestamp': FieldValue.serverTimestamp(),
            'questions': userDataList,
          };

          await answersCollection
              .doc(uid)
              .collection('users_answer')
              .doc(formTitle) // Use a unique identifier for each question
              .set(userData);
        }
        print('User answers added to Firestore');
      } catch (e) {
        print('Error handling user answers: $e');
      }
    }
  }
}
