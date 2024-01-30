import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:SiBunga/screens/buku_anak/buku_screen.dart';
import 'package:SiBunga/screens/login_signup/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class duatahunBuku extends StatefulWidget {
  @override
  _duatahunBukuState createState() => _duatahunBukuState();
}

class _duatahunBukuState extends State<duatahunBuku> {
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

  List<bool?> selectedValues = List.generate(9, (index) => null);
  List<Map<String, dynamic>> questions = [
    {'number': 1, 'question': 'Anak bisa jalan naik tangga sendiri?'},
    {'number': 2, 'question': 'Anak bisa bermain dan menendang bola kecil?'},
    {'number': 3, 'question': 'Anak bisa mencoret-coret pensil pada kertas?'},
    {
      'number': 4,
      'question': 'Anak bisa bicara dengan baik, menggunakan 2 kata?'
    },
    {
      'number': 5,
      'question':
          'Anak bisa menunjuk 1 atau lebih bagian tubuhnya ketika diminta?'
    },
    {
      'number': 6,
      'question':
          'Anak bisa melihat gambar dan dapat menyebut dengan benar nama 2 benda atau lebih?'
    },
    {
      'number': 7,
      'question':
          'Anak bisa membantu memungut mainannya sendiri atau membantu mengangkat piring jika diminta?'
    },
    {
      'number': 8,
      'question': 'Anak bisa makan nasi sendiri tanpa banyak tumpah?'
    },
    {'number': 9, 'question': 'Anak bisa melepas pakaiannya sendiri?'},
  ];

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
        title: Text('Usia 24 - 36 Bulan'),
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
            saveAnswersToDatabase(
                'Usia 24 - 36 Bulan'); // Pass the form title here
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BukuScreen(
                  inputTime: DateTime.now(),
                  formTitle: 'Usia 24 - 36 Bulan',
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
