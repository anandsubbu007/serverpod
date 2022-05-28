import 'dart:async';
import 'package:serverpod/src/database/mongoDb_connection.dart';

import '../server/session.dart';
import 'database_connection.dart';

/// Provides easy access to the database in relation to the current [Session].
class MongoDatabase {
  /// The [Session] the database is currently related to.
  Session session;

  MongoDbConnection? _databaseConnection;

  /// The [DatabaseConnection] currently used to access the database.
  Future<MongoDbConnection> get databaseConnection async {
    if (_databaseConnection != null) return _databaseConnection!;
    return MongoDbConnection(session.server.mongoDbConfig);
  }

  /// Creates a new [Database] object. Typically, this is done automatically
  /// when a [Session] is created.
  MongoDatabase({required this.session});


}
