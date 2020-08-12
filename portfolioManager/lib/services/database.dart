import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference trapsCollection =
      Firestore.instance.collection('traps');

  Future updateUserData(String name, String bomb, String giantBomb) async {
    return await trapsCollection
        .document(uid)
        .setData({'name': name, 'giantBomb': giantBomb, 'bomb': bomb});
  }

  // get traps stream
  Stream<QuerySnapshot> get traps {
    return trapsCollection.snapshots();
  }
}
