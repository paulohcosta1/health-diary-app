import 'package:healthdiary/domain/entities/food_entity.dart';

abstract class LoadFoods {
  Future<List<FoodEntity>> load();
}

