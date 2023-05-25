import 'package:banco_dados/database.dart';

void main() async {
  var database = Database();

  var conn = await database.openConnection();

  var saldo = await conn.query('select * from conta_corrent');

  await conn.transaction((_) async {
    print('Saldo Inicial => ${saldo.first['saldo']}');

    var saldoAtual = saldo.first['saldo'] as double;
    var saque = 100;

    await conn.query(
        'update conta_corrent set saldo=? where id=?', [saldoAtual - saque, 1]);

    await conn
        .query('insert into tira_dinheiro (id, data_saque) values (?, ?)', [
      null,
      DateTime.now().toIso8601String(),
    ]);

    var saldoFinal = await conn.query('select * from conta_corrent');

    print('Saldo Final => ${saldoFinal.first['saldo']}');
  });
}
