// Importa o pacote sqflite para permitir a comunicação com o banco de dados SQLite.
import 'package:app_tarefas/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
// Importa o pacote path para ajudar a construir o caminho do arquivo do banco de dados de forma compatível com qualquer sistema operacional (Android/iOS).
import 'package:path/path.dart';


// Declara uma função assíncrona que retornará uma instância do banco de dados no futuro.
Future<Database> getDatabase() async {
  // Pega o caminho padrão onde os bancos de dados do aplicativo são armazenados.
  // 'await' é usado porque getDatabasesPath() é uma operação assíncrona.
  // Junta o caminho do diretório de bancos de dados com o nome do nosso arquivo de banco de dados ('task.db').
  final String path = join(await getDatabasesPath(), 'task.db');

  // Abre o banco de dados. Se o arquivo 'task.db' não existir, ele será criado.
  return openDatabase(
    path,
    // A função 'onCreate' é executada somente na primeira vez que o banco de dados é criado.
    onCreate: (db, version) {
      db.execute(TaskDao.tableSQL);
    },
    // Define a versão do banco de dados. Útil para futuras migrações (atualizações de estrutura).
    version: 1,
  );
}

