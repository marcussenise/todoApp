import 'package:flutter/material.dart';
import 'package:todo/features/todo/todo_page.dart';
import 'package:todo/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TarefApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
         '/': (context) => const MyHomePage(),
         '/todoPage': (context) => const TodoPage(),
      },
    );
  }
}

