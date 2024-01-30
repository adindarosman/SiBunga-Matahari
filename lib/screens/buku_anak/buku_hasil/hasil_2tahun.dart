import 'package:SiBunga/core/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class hasil_2Tahun extends StatefulWidget {
  @override
  _hasil_2TahunState createState() => _hasil_2TahunState();
}

class _hasil_2TahunState extends State<hasil_2Tahun> {
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('buku_anak');

  Future<List<Map<String, dynamic>>> fetchUserAnswers() async {
    try {
      // Fetch the user ID
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid;

        // Fetch the data from a specific document with the given name
        QuerySnapshot userAnswersQuery = await dataCollection
            .doc(userId)
            .collection('users_answer')
            .where('formTitle', isEqualTo: 'Usia 24 - 36 Bulan')
            .get();

        if (userAnswersQuery.docs.isNotEmpty) {
          // Assuming there's only one document with this title, get the first one
          DocumentSnapshot userAnswersDoc = userAnswersQuery.docs.first;

          // Extract the data from the document
          Map<String, dynamic> userData =
              userAnswersDoc.data() as Map<String, dynamic>;

          // Access the 'questions' array
          List<Map<String, dynamic>> questions =
              List.from(userData['questions'] as List);

          return questions;
        } else {
          print('userAnswerQuery.docs is empty');
          return [];
        }
      } else {
        print('Document with title "Usia 24 - 36 Bulan" not found');
        return [];
      }
    } catch (e) {
      print('Error fetching user answers: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchUserAnswers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SizedBox();
        } else {
          List<Map<String, dynamic>> userAnswers = snapshot.data!;

          return Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the value as needed
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Usia 24 - 36 Bulan',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: userAnswers.map((answer) {
                        int number = answer['number'] as int;
                        String question = answer['question'] as String;
                        bool answerValue = answer['answer'] as bool;

                        String answerText = answerValue ? 'Ya' : 'Tidak';

                        return Text(
                          '$number. $question\nJawaban = $answerText',
                          style: TextStyle(color: Colors.black),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}



//  FutureBuilder(
//         future: fetchUserAnswers(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: userAnswers.length,
//               itemBuilder: (context, index) {
//                 int number = userAnswers[index]['number'] as int;
//                 String question = userAnswers[index]['question'] as String;
//                 bool answer = userAnswers[index]['answer'] as bool;

//                 return ListTile(
//                   title: Text('Question $number: $question'),
//                   subtitle: Text('Answer: $answer'),
//                   // Add more widgets here based on your needs
//                 );
//               },
//             );
//             // You can return a widget here if needed
//           //  return Container();
//           } 
//         },
//     );    


// final CollectionReference dataCollection =
//       FirebaseFirestore.instance.collection('buku_anak');

//   Future<void> fetchUserAnswers() async {
//   try {
//     // Fetch the user ID
//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       String userId = user.uid;

//       // Fetch the data from a specific document with the given name
//       QuerySnapshot userAnswersQuery = await dataCollection
//           .doc(userId)
//           .collection('users_answer')
//           .where('formTitle', isEqualTo: 'Usia 29 Hari - 3 Bulan')
//           .get();

//       // Check if any documents match the query
//       if (userAnswersQuery.docs.isNotEmpty) {
//         // Assuming there's only one document with this name, get the first one
//         DocumentSnapshot userAnswersDoc = userAnswersQuery.docs.first;

//         // Extract the data from the document
//         Map<String, dynamic> userData = userAnswersDoc.data() as Map<String, dynamic>;

//         // Access the 'questions' array
//         List<Map<String, dynamic>> questions = List.from(userData['questions'] as List);

//         for (var questionData in questions) {
//           int? number = questionData['number'] as int?;
//           String? question = questionData['question'] as String?;
//           bool? answer = questionData['answer'] as bool?;

//           // Check for null values before using them
//           if (number != null && question != null && answer != null) {
//             // Use the data in your widget
//           // Do something with the data (e.g., store in a list, update state, etc.)
//            print('Question $number: $question');
//           } else {
//             print('Some fields are null in the question data');
//           }
//         }
//         } else {
//         print('Document with title "Usia 29 Hari - 3 Bulan" not found');
//         }
//       }
//   } catch (e) {
//     print('Error fetching user answers: $e');
//   }

