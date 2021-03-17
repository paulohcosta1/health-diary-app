import 'package:faker/faker.dart';
import 'package:healthdiary/domain/entities/entities.dart';

class FakeFoodsFactory {
  static List<FoodEntity> makeEntities() => [
        FoodEntity(
          id: faker.guid.guid(),
          carb: faker.randomGenerator.decimal(),
          energy: faker.randomGenerator.integer(10),
          fat: faker.randomGenerator.decimal(),
          protein: faker.randomGenerator.decimal(),
          name: faker.lorem.word(),
          quantity: faker.randomGenerator.integer(10),
        ),
        FoodEntity(
          id: faker.guid.guid(),
          carb: faker.randomGenerator.decimal(),
          energy: faker.randomGenerator.integer(10),
          fat: faker.randomGenerator.decimal(),
          protein: faker.randomGenerator.decimal(),
          name: faker.lorem.word(),
          quantity: faker.randomGenerator.integer(10),
        ),
      ];

  static List<Map> makeApiJson() => [
        {
          'id': faker.guid.guid(),
          'name': faker.randomGenerator.string(50),
          'carb': faker.randomGenerator.decimal(),
          'protein': faker.randomGenerator.decimal(),
          'quantity': faker.randomGenerator.decimal(),
          'fat': faker.randomGenerator.decimal(),
          'energy': faker.randomGenerator.decimal(),
        },
        {
          'id': faker.guid.guid(),
          'name': faker.randomGenerator.string(50),
          'carb': faker.randomGenerator.decimal(),
          'protein': faker.randomGenerator.decimal(),
          'quantity': faker.randomGenerator.decimal(),
          'fat': faker.randomGenerator.decimal(),
          'energy': faker.randomGenerator.decimal(),
        },
      ];

  static List<Map> makeInvalidApiJson() => [
        {'invalid_key': 'invalid_value'}
      ];
}
