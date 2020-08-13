import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolioManager/models/trap.dart';
import 'package:portfolioManager/models/user.dart';

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

  // trap list from snapshot
  List<Trap> _trapListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Trap(
          name: doc.data['name'] ?? '',
          bomb: doc.data['bomb'] ?? '',
          giantBomb: doc.data['giantBomb'] ?? '');
    }).toList();
  }

  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        bomb: snapshot.data['bomb'],
        giantBomb: snapshot.data['giantBomb']);
  }

  // get traps stream
  Stream<List<Trap>> get traps {
    return trapsCollection.snapshots().map(_trapListFromSnapshot);
  }

  // get unser doc stream
  Stream<UserData> get userData {
    return trapsCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
