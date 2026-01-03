// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoriteMealsTable extends FavoriteMeals
    with TableInfo<$FavoriteMealsTable, FavoriteMeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  @override
  late final GeneratedColumn<String> mealId = GeneratedColumn<String>(
    'meal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [mealId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteMeal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meal_id')) {
      context.handle(
        _mealIdMeta,
        mealId.isAcceptableOrUnknown(data['meal_id']!, _mealIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mealIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mealId};
  @override
  FavoriteMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteMeal(
      mealId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_id'],
      )!,
    );
  }

  @override
  $FavoriteMealsTable createAlias(String alias) {
    return $FavoriteMealsTable(attachedDatabase, alias);
  }
}

class FavoriteMeal extends DataClass implements Insertable<FavoriteMeal> {
  final String mealId;
  const FavoriteMeal({required this.mealId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meal_id'] = Variable<String>(mealId);
    return map;
  }

  FavoriteMealsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteMealsCompanion(mealId: Value(mealId));
  }

  factory FavoriteMeal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteMeal(mealId: serializer.fromJson<String>(json['mealId']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'mealId': serializer.toJson<String>(mealId)};
  }

  FavoriteMeal copyWith({String? mealId}) =>
      FavoriteMeal(mealId: mealId ?? this.mealId);
  FavoriteMeal copyWithCompanion(FavoriteMealsCompanion data) {
    return FavoriteMeal(
      mealId: data.mealId.present ? data.mealId.value : this.mealId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMeal(')
          ..write('mealId: $mealId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => mealId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteMeal && other.mealId == this.mealId);
}

class FavoriteMealsCompanion extends UpdateCompanion<FavoriteMeal> {
  final Value<String> mealId;
  final Value<int> rowid;
  const FavoriteMealsCompanion({
    this.mealId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteMealsCompanion.insert({
    required String mealId,
    this.rowid = const Value.absent(),
  }) : mealId = Value(mealId);
  static Insertable<FavoriteMeal> custom({
    Expression<String>? mealId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mealId != null) 'meal_id': mealId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteMealsCompanion copyWith({Value<String>? mealId, Value<int>? rowid}) {
    return FavoriteMealsCompanion(
      mealId: mealId ?? this.mealId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mealId.present) {
      map['meal_id'] = Variable<String>(mealId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMealsCompanion(')
          ..write('mealId: $mealId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteMealsTable favoriteMeals = $FavoriteMealsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteMeals];
}

typedef $$FavoriteMealsTableCreateCompanionBuilder =
    FavoriteMealsCompanion Function({required String mealId, Value<int> rowid});
typedef $$FavoriteMealsTableUpdateCompanionBuilder =
    FavoriteMealsCompanion Function({Value<String> mealId, Value<int> rowid});

class $$FavoriteMealsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteMealsTable> {
  $$FavoriteMealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get mealId => $composableBuilder(
    column: $table.mealId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteMealsTable> {
  $$FavoriteMealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get mealId => $composableBuilder(
    column: $table.mealId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteMealsTable> {
  $$FavoriteMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get mealId =>
      $composableBuilder(column: $table.mealId, builder: (column) => column);
}

class $$FavoriteMealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteMealsTable,
          FavoriteMeal,
          $$FavoriteMealsTableFilterComposer,
          $$FavoriteMealsTableOrderingComposer,
          $$FavoriteMealsTableAnnotationComposer,
          $$FavoriteMealsTableCreateCompanionBuilder,
          $$FavoriteMealsTableUpdateCompanionBuilder,
          (
            FavoriteMeal,
            BaseReferences<_$AppDatabase, $FavoriteMealsTable, FavoriteMeal>,
          ),
          FavoriteMeal,
          PrefetchHooks Function()
        > {
  $$FavoriteMealsTableTableManager(_$AppDatabase db, $FavoriteMealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> mealId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteMealsCompanion(mealId: mealId, rowid: rowid),
          createCompanionCallback:
              ({
                required String mealId,
                Value<int> rowid = const Value.absent(),
              }) => FavoriteMealsCompanion.insert(mealId: mealId, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteMealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteMealsTable,
      FavoriteMeal,
      $$FavoriteMealsTableFilterComposer,
      $$FavoriteMealsTableOrderingComposer,
      $$FavoriteMealsTableAnnotationComposer,
      $$FavoriteMealsTableCreateCompanionBuilder,
      $$FavoriteMealsTableUpdateCompanionBuilder,
      (
        FavoriteMeal,
        BaseReferences<_$AppDatabase, $FavoriteMealsTable, FavoriteMeal>,
      ),
      FavoriteMeal,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteMealsTableTableManager get favoriteMeals =>
      $$FavoriteMealsTableTableManager(_db, _db.favoriteMeals);
}
