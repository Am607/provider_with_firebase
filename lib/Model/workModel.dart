import 'package:flutter/material.dart';

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
}
