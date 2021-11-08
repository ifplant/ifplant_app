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
  });

  final int id;
  final String name;
  final String light;
  final String level;
  final String water;
  final String temperature;
  final String description;
  final Uint8List image;
}
