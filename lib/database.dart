import 'package:mysql1/mysql1.dart';

class Database {
  Future<MySqlConnection> openConnection() {
    var settings = ConnectionSettings(
      host: '192.168.10.10',
      port: 3306,
      user: 'homestead',
      password: 'secret',
      db: 'dart_mysql',
    );

    return MySqlConnection.connect(settings);
  }
}
