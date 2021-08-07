import 'dart:async';

import 'package:myworks/Model/workModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseApi {
  static Future<String> createTodo(WorkModel workModel) async {
    final docTodo = FirebaseFirestore.instance.collection('works').doc();

    workModel.id = docTodo.id;

    await docTodo.set(workModel.toJson());

    return docTodo.id;
  }

  // static Stream<QuerySnapshot> readTodos() { FirebaseFirestore.instance
  //   .collection('todo')
  //   .orderBy( Work.createdTime, descending: true)
  //   .snapshots()
  //   .transform<List<WorkModel>>(Utils.transformer(workm.fromJson));

  // }
  static Stream<List<WorkModel>> readCollection() {
    Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection('works').snapshots();

    return stream.map((stream) => stream.docChanges
        .map((doc) => WorkModel(
            id: doc.doc['id'],
            createdTime: doc.doc['createdTime'].toDate(),
            description: doc.doc['description'],
            title: doc.doc['title'],
            isDone: doc.doc['isDone']))
        .toList());
  }

  // main() async {
  //   await for (List<WorkModel> tasks in readCollection()) {
  //     useTasklist(tasks); // yay, the NEXT list is here
  //   }
  // }

  // void useTasklist(List<WorkModel> tasks) {
  //   print('asd');
  // }

  static Future updateWork(WorkModel workModel) async {
    final docTodo =
        FirebaseFirestore.instance.collection('works').doc(workModel.id);

    await docTodo.update(workModel.toJson());
  }

  static Future deleteWork(WorkModel workModel) async {
    final docTodo =
        FirebaseFirestore.instance.collection('works').doc(workModel.id);

    await docTodo.delete();
  }
}
