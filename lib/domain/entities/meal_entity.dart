import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'food_entity.dart';

class MealEntity extends Equatable {
  final String id;
  final String name;
  final List<FoodEntity> foods;

  List get props => [id, name,  foods];

  MealEntity({
    @required this.id,
    @required this.name,
    @required this.foods,   
  });
}
