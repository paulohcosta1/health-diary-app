import 'package:healthdiary/domain/entities/meal_entity.dart';

abstract class LoadMeals {
  Future<List<MealEntity>> load();
}

