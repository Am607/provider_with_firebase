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
}
