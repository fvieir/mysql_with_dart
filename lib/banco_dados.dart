import 'package:banco_dados/database.dart';

void main() async {
  final database = Database();

  var mysqlConnection = await database.openConnection();

  var insert = await mysqlConnection
      .query('insert into aluno (nome) values (?)', ['Fabricio']);

  print(insert.affectedRows);

  var update = await mysqlConnection
      .query('update aluno set nome=? where id =?', ['Fabricio Dourado', 1]);

  var aluno = await mysqlConnection.query('select * from aluno');
  print(aluno);

  await mysqlConnection.query('delete from aluno where id=?', [1]);

  var alunosCurrent = await mysqlConnection.query('select * from aluno');
  print(alunosCurrent);

  for (var aluno in alunosCurrent) {
    print(aluno);
  }
}
