import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FoodEntity extends Equatable{
  final String id;
  final String name;
  final double protein;
  final double carb;
  final double fat;
  final double quantity;
  final double fiber;

  List get props => [id, name, protein, carb,fat,quantity,fiber];

  FoodEntity({
    @required this.id,
    @required this.name,
    @required this.protein,
    @required this.carb,
    @required this.fat,
    @required this.quantity,
    this.fiber,
  });
}