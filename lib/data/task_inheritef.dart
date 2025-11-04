import 'package:app_tarefas/components/task.dart';
import 'package:flutter/material.dart';

class taskInherited extends InheritedWidget {
  taskInherited({super.key, required Widget child}) : super(child: child);

  final List<Task> taskList = [Task("Estudar Flutter", 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3 ),
  Task("Andar de Bike", 'https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 2),
  Task("Meditar", 'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg', 1),
  Task("Estudar", 'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg', 2 ),
  Task("Jogar", 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 5),
  Task("Jogar", 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 5),
  ];

  void newTask (String name, String photo, int dificult){
    taskList.add(Task(name, photo, dificult));
  }

  static taskInherited of(BuildContext context) {
    final taskInherited? result = context.dependOnInheritedWidgetOfExactType<taskInherited>();
    assert(result != null, 'No taskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(taskInherited old) {
    return old.taskList.length != taskList.length ;
  }
}

