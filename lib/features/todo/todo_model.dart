// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:todo/features/todo/todo_controller.dart';

class TodoModel {
  // String categoria (casa, trabalho, hobbie, outros)

  final String title;
  final String description;
  String? date;
  final String category; 

  TodoModel({
    required this.title,
    required this.description,
    this.date,
    required this.category,
  }) {
    date = TodoController().formatDate(); 
  }



  @override
  String toString() {
    return 'TodoModel(title: $title, description: $description, date: $date, category: $category)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'category': category,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] != null ? map['date'] as String : null,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
