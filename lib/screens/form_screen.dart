import 'package:app_tarefas/data/task_inheritef.dart';
import 'package:flutter/material.dart';

class formScreen extends StatefulWidget {
  const formScreen({Key? key, required this.taskContent}) : super(key: key);

  final BuildContext taskContent;

  @override
  State<formScreen> createState() => _formScreenState();
}

class _formScreenState extends State<formScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Nova Tarefa',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 700,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 3
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: TextFormField(
                      validator: (String? value){
                        if (value == null || value.isEmpty){
                          return 'Escreva uma tarefa';
                        };
                        return null;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        border: OutlineInputBorder(),
                        hint: Text(
                          textAlign: TextAlign.center,
                          "Nome",
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                         ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      controller: nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty || int.parse(value) < 1 || int.parse(value) > 5){
                          return 'Escreva uma dificuldade entre 1 e 5';
                        };
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        border: OutlineInputBorder(),
                        hint: Text(
                          textAlign: TextAlign.center,
                          "Dificulde",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      controller: difficultController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Insira uma url';
                        };
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {
                        });
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        border: OutlineInputBorder(),
                        hint: Text(
                          textAlign: TextAlign.center,
                          "Imagem",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      controller: imageController,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.blue)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        fit: BoxFit.cover,
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Image.asset('assets/imagens/NoPhoto.png',
                          fit: BoxFit.cover);
                      },
                      )
                    ),
                  ),
                  ElevatedButton(
                      style : ElevatedButton.styleFrom(
                          backgroundColor:Colors.blue),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // print(imageController.text);
                          // print(int.parse(difficultController.text));
                          // print(nameController.text);
                          taskInherited.of(widget.taskContent).newTask(nameController.text, imageController.text, int.parse(difficultController.text));
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Salvando Tarefa...')));
                          Navigator.pop(context);
                        };
                  },
                      child: Text(
                        'Adicionar',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),
                    )
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
