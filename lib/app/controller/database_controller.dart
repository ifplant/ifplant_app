import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseController extends GetxController {
  static const String dbTableName = 'PLANTS';
  static const String dbFileName = 'plants.db';
  static DataBaseController get to => Get.find();
  RxList<Plant> plantList = <Plant>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await initPlantDb();
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
      var data = await rootBundle.load(join('assets', dbFileName));
      print(data);
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path);
  }

  initPlantDb() async {
    final Database db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query(dbTableName);

    plantList(List.generate(maps.length, (index) {
      return Plant(
        id: maps[index]['id'],
        name: maps[index]['name'],
        water: maps[index]['water'],
        light: maps[index]['light'],
        level: maps[index]['level'],
        temperature: maps[index]['temperature'],
        description: maps[index]['description'],
        image: maps[index]['image'],
      );
    }));
  }
}
