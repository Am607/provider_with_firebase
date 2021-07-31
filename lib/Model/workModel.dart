import 'package:flutter/material.dart';
import 'package:myworks/Utils/utils.dart';

class Work {
  static const createdTime = 'createdTime';
}

//! model for workdata

class WorkModel {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  WorkModel({
    required this.createdTime,
    required this.title,
    required this.description,
    required this.id,
    this.isDone = false,
  });


  static WorkModel fromJson(Map<String, dynamic> json) => WorkModel(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };
}
