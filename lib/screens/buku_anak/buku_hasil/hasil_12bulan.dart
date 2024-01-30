import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class hasil_12Bulan extends StatefulWidget {
  hasil_12Bulan({super.key});

  @override
  State<hasil_12Bulan> createState() => _hasil_12BulanState();
}

class _hasil_12BulanState extends State<hasil_12Bulan> {
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
            .where('formTitle', isEqualTo: 'Usia 9 - 12 Bulan')
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
        print('Document with title "Usia 9 - 12 Bulan" not found');
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
                      'Usia 9 - 12 Bulan',
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
