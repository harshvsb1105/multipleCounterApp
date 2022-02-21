import 'package:cloud_firestore/cloud_firestore.dart';

 class BaseService{

  Future<void> updateDocument(Map<String, dynamic> data, String id, CollectionReference ref) async {
    await ref.doc(id).update(data).then((value) {
      print('Updated: $data');
    }).catchError((e) {
      print(e);
      throw e;
    });
  }

}