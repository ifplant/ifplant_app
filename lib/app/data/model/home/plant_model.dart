import 'dart:typed_data';

class Plant {
  Plant({
    required this.id,
    required this.image,
    this.light = "",
    this.level = "",
    this.water = "",
    this.temperature = "",
    this.description = "",
    this.name = "",
    this.engName = "",
    this.kind = "",
    this.price = "",
  });

  final int id;
  final String name;
  final String engName;
  final String light;
  final String level;
  final String water;
  final String temperature;
  final String description;
  final String kind;
  final String price;
  final Uint8List image;
}
