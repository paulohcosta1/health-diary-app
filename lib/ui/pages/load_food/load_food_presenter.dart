import 'package:healthdiary/ui/pages/load_food/load_food_viewmodel.dart';

abstract class LoadFoodPresenter {
  Stream<bool> get isLoadingStream;
  Stream<List<LoadFoodViewModel>> get foodsResultStream;
  Future<void> loadData();
}
