import 'package:mongo_dart/mongo_dart.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// A connection to the database. In most cases the [Database] db object in
/// the [Session] object should be used when connecting with the database.
class MongoDbConnection {
  /// Database configuration.
  final MongoDBConfig config;

  /// Access to the raw MongoDb connection.
  late Db mongoDb;

  /// Creates a new database connection from the configuration. For most cases
  /// this shouldn't be called directly, use the db object in the [Session] to
  /// access the database.
  MongoDbConnection(this.config) {
    mongoDb = config.mongoDb;
  }

  /// Returns a list of names of all tables in the current database.
  Future<List<String?>> getCollectionNames() async {
    return mongoDb.getCollectionNames();
  }

  /// For most cases use the corresponding method in [Database] instead.
  Future findByCollection<T>(
    int id, {
    required Session session,
    Transaction? transaction,
  }) async {
    UnimplementedError();
  }

  /// For most cases use the corresponding method in [Database] instead.
  Future<bool> update(TableRow row, {required Session session}) async {
    UnimplementedError();
    return true;
  }

  /// For most cases use the corresponding method in [Database] instead.
  Future<void> insert(TableRow row, {required Session session}) async {
    UnimplementedError();
  }

  /// For most cases use the corresponding method in [Database] instead.
  Future<int> delete<T>(
      {required Expression where, required Session session}) async {
    UnimplementedError();
    return 0;
  }

  /// For most cases use the corresponding method in [Database] instead.
  Future<bool> deleteRow(TableRow row, {required Session session}) async {
    return true;
  }

  /// For most cases use the corresponding method in [Database] instead.
  Future<List<List<dynamic>>> query(String query,
      {required Session session, int? timeoutInSeconds}) async {
    UnimplementedError();
    return [];
  }

  void _logQuery(Session session, String query, DateTime startTime,
      {int? numRowsAffected, exception, StackTrace? trace}) {
    session.sessionLogs.queries.add(
      QueryLogEntry(
        sessionLogId: session.temporarySessionId,
        serverId: session.server.serverId,
        query: query,
        duration:
            DateTime.now().difference(startTime).inMicroseconds / 1000000.0,
        numRows: numRowsAffected,
        error: exception?.toString(),
        stackTrace: trace?.toString(),
      ),
    );
  }
}
