import 'package:equatable/equatable.dart';
import 'package:healthdiary/domain/entities/food_entity.dart';
import 'package:meta/meta.dart';

abstract class AddFood {
  Future<void> add(AddFoodParams params);
}

class AddFoodParams extends Equatable {
  final String mealId;
  final FoodEntity food;

  List get props => [mealId, food];

  AddFoodParams({
    @required this.mealId,
    @required this.food,
  });
}
