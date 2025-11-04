import 'package:app_tarefas/data/task_inheritef.dart';
import 'package:app_tarefas/screens/form_screen.dart';
import 'package:app_tarefas/screens/inicial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: taskInherited(child: InitialScreen()),
    );
  }
}




