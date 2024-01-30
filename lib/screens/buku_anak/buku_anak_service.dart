import 'package:cloud_firestore/cloud_firestore.dart';

class BukuAnakService {
  final CollectionReference answersCollection =
      FirebaseFirestore.instance.collection('buku_anak');

  Future<void> saveAnswers(String userId, String formId, List<bool?> answers) async {
    try {
      // Create a document for the user's answers
      await answersCollection.doc(userId).set({
        'formId': formId,
        'timestamp': FieldValue.serverTimestamp(),
        'answers': answers,
      });
    } catch (e) {
      print('Error saving answers: $e');
      // Handle error appropriately, e.g., show an error message to the user
    }
  }

  Future<List<bool?>?> getAnswers(String userId, String formId) async {
  try {
    // Retrieve the user's answers from Firestore
    final doc = await answersCollection.doc(userId).get();

    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      if (data['formId'] == formId) {
        return List<bool?>.from(data['']);
      }
    }
  } catch (e) {
    print('Error getting answers: $e');
    // Handle error appropriately, e.g., show an error message to the user
  }

  return null;
}

}
