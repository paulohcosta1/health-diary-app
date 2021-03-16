import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoadFoodViewModel extends Equatable {
  final String name;
  final double carb;
  final double protein;
  final double fat;
  final double energy;
  final double quantity;

  List get props => [name, carb, protein, fat, energy, quantity];

  LoadFoodViewModel({
    this.name,
    @required this.carb,
    @required this.protein,
    @required this.fat,
    @required this.energy,
    @required this.quantity,
  });
}
