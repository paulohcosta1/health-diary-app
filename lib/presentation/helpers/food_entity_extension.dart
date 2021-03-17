import 'package:healthdiary/domain/entities/entities.dart';
import 'package:healthdiary/ui/pages/load_food/load_food_viewmodel.dart';

extension FoodEntityExtensions on FoodEntity {
  LoadFoodViewModel toViewModel() => LoadFoodViewModel(
        id: id,
        name: name,
        carb: carb,
        fat: fat,
        energy: energy,
        quantity: quantity,
        protein: protein,
      );
}
