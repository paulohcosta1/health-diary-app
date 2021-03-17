import 'package:flutter_test/flutter_test.dart';
import 'package:healthdiary/domain/entities/entities.dart';
import 'package:healthdiary/domain/errors/domain_error.dart';
import 'package:healthdiary/domain/usecases/usecases.dart';
import 'package:healthdiary/presentation/presenters/getx_load_food_presenter.dart';
import 'package:healthdiary/ui/helpers/ui_errors.dart';
import 'package:healthdiary/ui/pages/load_food/load_food_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/fake_foods_factory.dart';

class LoadFoodsSpy extends Mock implements LoadFoods {}

void main() {
  GetxLoadFoodPresenter sut;
  LoadFoodsSpy loadFoods;
  List<FoodEntity> foods;

  PostExpectation mockLoadFoodsCall() => when(loadFoods.load());

  void mockLoadFoods(List<FoodEntity> data) {
    foods = data;
    mockLoadFoodsCall().thenAnswer((_) async => foods);
  }

  void mockLoadSurveysError() =>
      mockLoadFoodsCall().thenThrow(DomainError.unexpected);

  setUp(() {
    loadFoods = LoadFoodsSpy();
    sut = GetxLoadFoodPresenter(loadFoods: loadFoods);
    mockLoadFoods(FakeFoodsFactory.makeEntities());
  });

  test('Should call LoadFoods on loadData', () async {
    await sut.loadData();

    verify(loadFoods.load()).called(1);
  });

  test('Should emit correct events on success', () async {
    // expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    sut.foodsResultStream.listen(
      expectAsync1(
        (foods) => expect(
          foods,
          [
            LoadFoodViewModel(
              id: foods[0].id,
              carb: foods[0].carb,
              energy: foods[0].energy,
              fat: foods[0].fat,
              name: foods[0].name,
              protein: foods[0].protein,
              quantity: foods[0].quantity,
            ),
            LoadFoodViewModel(
              id: foods[1].id,
              carb: foods[1].carb,
              energy: foods[1].energy,
              fat: foods[1].fat,
              name: foods[1].name,
              protein: foods[1].protein,
              quantity: foods[1].quantity,
            ),
          ],
        ),
      ),
    );

    await sut.loadData();
  });

  test('Should emit correct events on failure', () async {
    mockLoadSurveysError();

    // expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    sut.foodsResultStream.listen(
      null,
      onError: expectAsync1(
        (error) => expect(
          error,
          UIError.unexpectedError.description,
        ),
      ),
    );

    await sut.loadData();
  });
}
