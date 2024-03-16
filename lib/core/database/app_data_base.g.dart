// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_base.dart';

// ignore_for_file: type=lint
class $MovieTableTable extends MovieTable
    with TableInfo<$MovieTableTable, MovieTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageRatingMeta =
      const VerificationMeta('ageRating');
  @override
  late final GeneratedColumn<int> ageRating = GeneratedColumn<int>(
      'age_rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, ageRating];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movie_table';
  @override
  VerificationContext validateIntegrity(Insertable<MovieTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('age_rating')) {
      context.handle(_ageRatingMeta,
          ageRating.isAcceptableOrUnknown(data['age_rating']!, _ageRatingMeta));
    } else if (isInserting) {
      context.missing(_ageRatingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MovieTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      ageRating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age_rating'])!,
    );
  }

  @override
  $MovieTableTable createAlias(String alias) {
    return $MovieTableTable(attachedDatabase, alias);
  }
}

class MovieTableData extends DataClass implements Insertable<MovieTableData> {
  final int id;
  final String name;
  final String description;
  final int ageRating;
  const MovieTableData(
      {required this.id,
      required this.name,
      required this.description,
      required this.ageRating});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['age_rating'] = Variable<int>(ageRating);
    return map;
  }

  MovieTableCompanion toCompanion(bool nullToAbsent) {
    return MovieTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      ageRating: Value(ageRating),
    );
  }

  factory MovieTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      ageRating: serializer.fromJson<int>(json['ageRating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'ageRating': serializer.toJson<int>(ageRating),
    };
  }

  MovieTableData copyWith(
          {int? id, String? name, String? description, int? ageRating}) =>
      MovieTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        ageRating: ageRating ?? this.ageRating,
      );
  @override
  String toString() {
    return (StringBuffer('MovieTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ageRating: $ageRating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, ageRating);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.ageRating == this.ageRating);
}

class MovieTableCompanion extends UpdateCompanion<MovieTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> ageRating;
  final Value<int> rowid;
  const MovieTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ageRating = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MovieTableCompanion.insert({
    required int id,
    required String name,
    required String description,
    required int ageRating,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        ageRating = Value(ageRating);
  static Insertable<MovieTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? ageRating,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ageRating != null) 'age_rating': ageRating,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MovieTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? ageRating,
      Value<int>? rowid}) {
    return MovieTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ageRating: ageRating ?? this.ageRating,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ageRating.present) {
      map['age_rating'] = Variable<int>(ageRating.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ageRating: $ageRating, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MovieTableTable movieTable = $MovieTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movieTable];
}
