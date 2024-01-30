import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ModelDataPertumbuhan {
  final DateTime date;
  final double? beratBadan;
  final double? tinggiBadan;
  final double? lingkarKpl;
  final double? lingkarLgn;

  ModelDataPertumbuhan({
    required this.date,
    this.beratBadan,
    this.tinggiBadan,
    this.lingkarKpl,
    this.lingkarLgn,
  });
}

Future<List<ModelDataPertumbuhan>> fetchDataPertumbuhan() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    String uid = user.uid;
    CollectionReference dataPertumbuhanCollection =
        FirebaseFirestore.instance.collection('data_pertumbuhan');

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await dataPertumbuhanCollection
              .doc(uid)
              .collection('data')
              .orderBy('date', descending: true)
              .limit(12)
              .get();

      List<ModelDataPertumbuhan> growthDataList = querySnapshot.docs
          .map((DocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic> data = doc.data()!;
        return ModelDataPertumbuhan(
          date: (data['date'] as Timestamp).toDate(),
          beratBadan: data['beratBadan']?.toDouble(),
          tinggiBadan: data['tinggiBadan']?.toDouble(),
          lingkarKpl: data['lingkarKpl']?.toDouble(),
          lingkarLgn: data['lingkarLgn']?.toDouble(),
        );
      }).toList();

      return growthDataList;
    } catch (e) {
      print('Error fetching growth data: $e');
    }
  }

  // Return a default list or handle error as needed
  return [];
}
