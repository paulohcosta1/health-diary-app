import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthdiary/application/protocols/http/http.dart';
import 'package:healthdiary/application/usecases/load_foods/remote_load_foods.dart';
import 'package:healthdiary/domain/entities/food_entity.dart';
import 'package:healthdiary/domain/errors/domain_error.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/fake_foods_factory.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteLoadFoods sut;
  HttpClientSpy httpClient;
  String url;
  List<Map> list;

  PostExpectation mockRequest() => when(
        httpClient.request(
          url: anyNamed('url'),
          method: anyNamed('method'),
        ),
      );

  void mockHttpData(List<Map> data) {
    list = data;
    mockRequest().thenAnswer((_) async => data);
  }

  void mockHttpError(HttpError error) => mockRequest().thenThrow(error);

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = RemoteLoadFoods(url: url, httpClient: httpClient);
    mockHttpData(FakeFoodsFactory.makeApiJson());
  });

  test('Should call HttpClient with correct values', () async {
    await sut.load();

    verify(
      httpClient.request(
        url: url,
        method: 'get',
      ),
    );
  });

  test('Should return surveys on 200', () async {
    final surveys = await sut.load();

    expect(surveys, [
      FoodEntity(
        id: list[0]['id'],
        carb: list[0]['carb'],
        fat: list[0]['fat'],
        quantity: list[0]['quantity'],
        protein: list[0]['protein'],
        name: list[0]['name'],
        energy: list[0]['energy'],
      ),
      FoodEntity(
        id: list[1]['id'],
        carb: list[1]['carb'],
        fat: list[1]['fat'],
        quantity: list[1]['quantity'],
        protein: list[1]['protein'],
        name: list[1]['name'],
        energy: list[1]['energy'],
      ),
    ]);
  });

  test(
      'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    mockHttpData(FakeFoodsFactory.makeInvalidApiJson());

    final future = sut.load();

    expect(future, throwsA(describeEnum(DomainError.unexpected)));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    mockHttpError(HttpError.notFound);

    final future = sut.load();

    expect(future, throwsA(describeEnum(DomainError.unexpected)));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    mockHttpError(HttpError.serverError);

    final future = sut.load();

    expect(future, throwsA(describeEnum(DomainError.unexpected)));
  });
}
