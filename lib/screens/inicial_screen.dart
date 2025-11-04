

import 'package:app_tarefas/components/task.dart';
import 'package:app_tarefas/data/task_inheritef.dart';
import 'package:flutter/material.dart';
import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InicialScreenState();
}


class _InicialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: Text(
          'Tarefas',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: ListView(
        children: taskInherited.of(context).taskList,
      ),
      // ...
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => formScreen(taskContent: context),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
// ...
    );
  }
}