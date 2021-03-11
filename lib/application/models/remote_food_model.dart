import 'package:healthdiary/application/protocols/http/http.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class RemoteFoodModel {
  final String id;
  final String name;
  final double protein;
  final double carb;
  final double fat;
  final double quantity;
  final double fiber;

  RemoteFoodModel({
    @required this.id,
    @required this.name,
    @required this.protein,
    @required this.carb,
    @required this.quantity,
    @required this.fat,
    this.fiber,
  });

  factory RemoteFoodModel.fromJson(Map json) {
    if (!json.keys
        .toSet()
        .containsAll(['id', 'name', 'protein', 'carb', 'fat', 'quantity'])) {
      throw HttpError.invalidData;
    }
    return RemoteFoodModel(
      id: json['id'],
      name: json['name'],
      carb: json['carb'],
      protein: json['protein'],
      quantity: json['quantity'],
      fat: json['fat'],
      fiber: json['fiber'],
    );
  }

  FoodEntity toEntity() => FoodEntity(
        id: id,
        name: name,
        carb: carb,
        protein: protein,
        quantity: quantity,
        fat: fat,
        fiber: fiber,
      );

  Map<String, String> toJson() => {
        'id': id,
        'name': name,
        'carb': carb.toString(),
        'protein': protein.toString(),
        'quantity': quantity.toString(),
        'fat': fat.toString(),
        'fiber': fiber.toString(),
      };
}
