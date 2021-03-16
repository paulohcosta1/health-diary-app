import 'package:get/get.dart';
import 'package:healthdiary/ui/pages/load_food/load_food_viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:healthdiary/domain/usecases/load_foods.dart';
import 'package:healthdiary/ui/pages/load_food/load_food.dart';

class GetxLoadFoodPresenter extends GetX implements LoadFoodPresenter {
  final LoadFoods loadFoods;
  final _surveyResult = Rx<LoadFoodViewModel>();

  GetxLoadFoodPresenter({@required this.loadFoods});

  @override
  // TODO: implement isLoadingStream
  Stream<bool> get isLoadingStream => throw UnimplementedError();

  @override
  Future<void> loadData() async {
    final _surveyResult = await loadFoods.load();
  }
}
