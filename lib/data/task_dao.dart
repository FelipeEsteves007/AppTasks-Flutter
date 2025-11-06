import 'package:sqflite/sqflite.dart';

import '../components/task.dart';
import 'database.dart';

class TaskDao {
  // TABELA

  static const String tableSQL = 'CREATE TABLE $_tablename(' // Criando tabela
      '$_name TEXT, '
      '$_dificulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'TaskTable'; // Colocando um nome
  static const String _dificulty = 'Dificuldade';
  static const String _name = 'Nome';
  static const String _image = 'Imagem';


    // CRUD TABELA
    // SAVE
    save(Task tarefa) async {
      print('acessando o save');
      final Database bancoDeDados = await getDatabase();
      var itemExists = await find(tarefa.nome);
      Map<String, dynamic> taskMap = toMap(tarefa);
      if (itemExists.isEmpty){
        print('Tarefa não existe');
        return await bancoDeDados.insert(_tablename, taskMap);
      } else {
        print ('Tarefa já existe');
        return await bancoDeDados.update(_tablename, taskMap, where: '${_name} = ?', whereArgs: [tarefa.nome]);
      }
    }

    // TO MAP
    Map<String, dynamic> toMap(Task tarefa){
      print('convertendo tarefa em map');
      final Map<String, dynamic> mapaDeTarefas = Map();
      mapaDeTarefas[_name] = tarefa.nome;
      mapaDeTarefas[_dificulty] = tarefa.dificuldade;
      mapaDeTarefas[_image] = tarefa.foto;
      print('Mapa de tarefas: $mapaDeTarefas');
      return mapaDeTarefas;
    }

    // FIND
    Future<List<Task>> findAll() async {
      print('acessando o findAll');
      final Database bancoDeDados = await getDatabase(); // abrindo
      final List<Map<String, dynamic>> result = await bancoDeDados.query('$_tablename');
      print('acessando o findAll: $result');
      return toList(result);
    }
    // TO LIST
  List<Task> toList(List<Map<String, dynamic>> listaDeTarefas) {
    print('convertando tolist');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in listaDeTarefas) {
      final Task tarefa = Task(
          linha[_name],
          linha[_image],
          linha[_dificulty]
      );
      tarefas.add(tarefa);
    }
    print (tarefas);
    return tarefas;
  }

    //  FIND
  Future<List<Task>> find(String nomeTarefa) async {
      print('Acessando o find');
      final Database bancoDeDados = await getDatabase();
      final List<Map<String, dynamic> > result = await bancoDeDados.query(_tablename, where : '$_name = ?', whereArgs: [nomeTarefa]);
      print ('Tarefa encontrada : ${toList(result)}');
      return toList(result);
  }


  // DELETE
  delete(String nomeTarefa) async {
    print('Acessando o delete');
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.delete(_tablename, where: '$_name = ?', whereArgs: [nomeTarefa]);
    }
  }
