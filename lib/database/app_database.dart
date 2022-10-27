/* import 'dao/agenda_dao.dart';
import 'dao/alarme_dao.dart';
import 'dao/cuidador_dao.dart';
import 'dao/idoso_dao.dart';
import 'dao/ingestao_remedio_dao.dart';
import 'dao/remedio_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(AgendaDao.tableSql);
      db.execute(AlarmeDao.tableSql);
      db.execute(CuidadorDao.tableSql);
      db.execute(IdosoDao.tableSql);
      db.execute(IngestaoRemedioDao.tableSql);
      db.execute(RemedioDao.tableSql);
    },
    version: 1,
  );
} */
