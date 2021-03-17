import 'package:get/get.dart';
import 'package:healthdiary/ui/helpers/ui_errors.dart';
import 'package:healthdiary/ui/pages/load_food/load_food_viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:healthdiary/domain/usecases/load_foods.dart';
import 'package:healthdiary/ui/pages/load_food/load_food.dart';
import '../helpers/helpers.dart';

class GetxLoadFoodPresenter extends GetX implements LoadFoodPresenter {
  final LoadFoods loadFoods;
  final _foodsResult = Rx<List<LoadFoodViewModel>>();

  Stream<List<LoadFoodViewModel>> get foodsResultStream => _foodsResult.stream;

  GetxLoadFoodPresenter({@required this.loadFoods});

  @override
  // TODO: implement isLoadingStream
  Stream<bool> get isLoadingStream => throw UnimplementedError();

  @override
  Future<void> loadData() async {
    try {
      final foodsResult = await loadFoods.load();
      _foodsResult.value =
          foodsResult.map((food) => food.toViewModel()).toList();
    } catch (e) {
      print(e);
      // _foodsResult.subject.addError(UIError.unexpectedError.description);
    }
  }
}
