import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FoodEntity extends Equatable {
  final String id;
  final String name;
  final num protein;
  final num carb;
  final num fat;
  final num quantity;
  final num energy;

  List get props => [id, name, protein, carb, fat, quantity, energy];

  FoodEntity({
    @required this.id,
    @required this.name,
    @required this.protein,
    @required this.carb,
    @required this.fat,
    @required this.quantity,
    @required this.energy,
  });
}
