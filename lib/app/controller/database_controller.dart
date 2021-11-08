import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDB();
  }

  Future<Database> getDB() async {
    var dataBasePath = await getDatabasesPath();
    var path = join(dataBasePath, '~wwww/plants.db');
    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (error) {
        print(error);
      }
      var data = await rootBundle.load(join('assets', 'plants.db'));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path);
  }
}
