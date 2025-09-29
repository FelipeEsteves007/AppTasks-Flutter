import 'package:app_tarefas/components/difficulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome,this.foto,this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.black45,
                      ),
                      width: 80,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: TextStyle(
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.dificuldade,)
                      ],
                    ),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_drop_up, color: Colors.white,),
                            Text("up", style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0 ? (nivel / widget.dificuldade) / 10 : 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nível: $nivel",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}