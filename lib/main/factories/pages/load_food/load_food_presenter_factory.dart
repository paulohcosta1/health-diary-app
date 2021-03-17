import 'package:healthdiary/main/factories/usecases/load_foods_factory.dart';
import 'package:healthdiary/presentation/presenters/getx_load_food_presenter.dart';
import 'package:healthdiary/ui/pages/load_food/load_food.dart';

LoadFoodPresenter makeGetxSurveysPresenter() => GetxLoadFoodPresenter(
      loadFoods: makeRemoteLoadFoods(),
    );
