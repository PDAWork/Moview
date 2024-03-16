import 'package:drift/drift.dart';

 class MovieTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get ageRating => integer()();
}
