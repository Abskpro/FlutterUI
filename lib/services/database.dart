import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zeroday/models/interns.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference internCollection =
      FirebaseFirestore.instance.collection('internship');

  Future updateUserData(String name, int age, String university) async {
    return await internCollection.doc(uid).set({
      'name': name,
      'age': age,
      'university': university,
    });
  }

  //intern list from snapshot
  List<Intern> _internListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // print(doc.data()['name']);
      return Intern(
        name: doc.data()['name'].toString() ?? '',
        age: doc.data()['age'].toString() ?? 0,
        university: doc.data()['university'].toString() ?? '',
      );
    }).toList();
  }

  Stream<List<Intern>> get interns {
    return internCollection.snapshots().map(_internListFromSnapshot);
  }
}
