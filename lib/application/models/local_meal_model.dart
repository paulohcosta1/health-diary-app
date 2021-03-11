import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class LocalMealModel {
   final String id;
  final String name;
  final List<FoodEntity> foods;

  LocalMealModel({
    @required this.id,
    @required this.name,
    @required this.foods,
  });

  factory LocalMealModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'name', 'foods'])) {
      throw Exception();
    }
    return LocalMealModel(
      id: json['id'],
      name: json['name'],
      foods: json['foods'],
    );
  }

  factory LocalMealModel.fromEntity(MealEntity entity) => LocalMealModel(
    id: entity.id,
    name: entity.name,
    foods: entity.foods,
  );

  MealEntity toEntity() => MealEntity(
    id: id,
    name: name,
    foods: foods,
  );

  Map<String, String> toJson() => {
    'id': id,
    'name': name,
    'foods': foods.toString(),
  };
}