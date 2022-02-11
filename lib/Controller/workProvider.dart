import 'package:flutter/cupertino.dart';
import 'package:myworks/Controller/firbaseApi.dart';
import 'package:myworks/Model/workModel.dart';

class WorkProvider extends ChangeNotifier {
  //! using in build data

  List<WorkModel> _works = [];

//! make list as a public

  List<WorkModel> get works =>
      _works.where((work) => work.isDone == false).toList();

//! filtering as a markedWork
  List<WorkModel> get workCompleted =>
      _works.where((work) => work.isDone == true).toList();

  void setTodos(List<WorkModel> workModel) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _works = workModel;
      print(works);
      notifyListeners();
    });
  }

  void addwork(WorkModel workModel) => FirebaseApi.createTodo(workModel);

  void removeWork(WorkModel workModel) => FirebaseApi.deleteWork(workModel);
//! for add to work

  bool toggleWorkStatus(WorkModel workModel) {
    workModel.isDone = !workModel.isDone;
    FirebaseApi.updateWork(workModel);

    return workModel.isDone;
  }

  void updateTodo(WorkModel workModel, String title, String description) {
    workModel.title = title;
    workModel.description = description;

    FirebaseApi.updateWork(workModel);
  }

//! for remove from work

  // void removeWork(WorkModel workModel) {
  //   _works.remove(workModel);
  //   notifyListeners();
  // }

//! for update to work

//! for marked as checked

}
