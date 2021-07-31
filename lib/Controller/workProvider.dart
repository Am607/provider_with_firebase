import 'package:flutter/cupertino.dart';
import 'package:myworks/Model/workModel.dart';

class WorkProvider extends ChangeNotifier {
  //! using in build data

  List<WorkModel> _works = [
    WorkModel(
        createdTime: DateTime.now(),
        title: 'Home work',
        id: '1',
        description: '''
      maths
      physics'''),
    WorkModel(
        createdTime: DateTime.now(),
        title: 'Shop work',
        id: '2',
        description: '''
      maths
      physics'''),
    WorkModel(
        createdTime: DateTime.now(),
        title: 'Shop work',
        id: '2',
        description: '''
      maths
      physics'''),
    WorkModel(
        createdTime: DateTime.now(),
        title: 'Shop work',
        id: '2',
        description: '''
      maths
      physics'''),
  ];

//! make list as a public

  List<WorkModel> get works =>
      _works.where((work) => work.isDone == false).toList();

//! filtering as a markedWork
  List<WorkModel> get workCompleted {
    return _works.where((work) => work.isDone == true).toList();
  }

//! for add to work
  void addWork(WorkModel workModel) {
    _works.add(workModel);
    notifyListeners();
  }

//! for remove from work
  void removeWork(WorkModel workModel) {
    _works.remove(workModel);
    notifyListeners();
  }

//! for update to work
  void updateTodo(WorkModel workModel, String title, String description) {
    workModel.title = title;
    workModel.description = description;
    notifyListeners();
  }

//! for marked as checked

  bool toggleWorkStatus(WorkModel workModel) {
    workModel.isDone = !workModel.isDone;
    notifyListeners();
    return workModel.isDone;
  }
}
