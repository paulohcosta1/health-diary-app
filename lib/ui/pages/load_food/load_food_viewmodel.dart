import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoadFoodViewModel extends Equatable {
  final String id;
  final String name;
  final num carb;
  final num protein;
  final num fat;
  final num energy;
  final num quantity;

  List get props => [id, name, carb, protein, fat, energy, quantity];

  LoadFoodViewModel({
    @required this.id,
    @required this.name,
    @required this.carb,
    @required this.protein,
    @required this.fat,
    @required this.energy,
    @required this.quantity,
  });
}
