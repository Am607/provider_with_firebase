


import 'package:myworks/Model/workModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseApi{




static Future<String> createTodo(WorkModel workModel) async {
    final docTodo = FirebaseFirestore.instance.collection('works').doc();

    workModel.id = docTodo.id;
    
    await docTodo.set(workModel.toJson());

    return docTodo.id;
  }



}