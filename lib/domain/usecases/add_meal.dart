import 'package:equatable/equatable.dart';
import 'package:healthdiary/domain/entities/meal_entity.dart';
import 'package:meta/meta.dart';

abstract class AddMeal {
  Future<MealEntity> add(AddMealParams params);
}

class AddMealParams extends Equatable {
  final String name;  

  List get props => [name];

  AddMealParams({
    @required this.name,  
  });
}