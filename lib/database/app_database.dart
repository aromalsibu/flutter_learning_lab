import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:drift/native.dart';
import 'package:flutter_learning_lab/database/tables/products.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'app_database.g.dart';

@DriftDatabase(tables: [Products, Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'mydb',
      native: DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

@DriftAccessor(tables: [Products, Users])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);





  Stream<List<Product>> getProductsFromCache() {
    return select(products).watch();
  }

  

  Future<void> cacheProducts(List<Product> productsList) {
    return batch((item) => item.insertAll(products, productsList));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final db = await getApplicationDocumentsDirectory();
    final file = File(p.join(db.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
