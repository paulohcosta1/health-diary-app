import 'package:healthdiary/application/protocols/http/http.dart';
import 'package:healthdiary/domain/entities/entities.dart';
import 'package:meta/meta.dart';

class RemoteFoodAnswerModel {
  final String name;
  final String id;
  final num protein;
  final num carb;
  final num fat;
  final num quantitiy;
  final num energy;
  RemoteFoodAnswerModel({
    @required this.id,
    @required this.name,
    @required this.protein,
    @required this.carb,
    @required this.quantitiy,
    @required this.fat,
    @required this.energy,
  });

  factory RemoteFoodAnswerModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(
        ['id', 'name', 'quantitiy', 'carb', 'protein', 'fat', 'energy'])) {
      throw HttpError.invalidData;
    }

    return RemoteFoodAnswerModel(
      id: json['id'],
      name: json['name'],
      carb: json['carb'],
      protein: json['protein'],
      quantitiy: json['quantitiy'],
      fat: json['fat'],
      energy: json['energy'],
    );
  }

  FoodEntity toEntity() => FoodEntity(
        id: id,
        name: name,
        carb: carb,
        protein: protein,
        quantity: quantitiy,
        fat: fat,
        energy: energy,
      );

  Map<String, String> toJson() => {
        'id': id,
        'name': name,
        'carb': carb.toString(),
        'protein': protein.toString(),
        'quantity': quantitiy.toString(),
        'fat': fat.toString(),
        'energy': energy.toString(),
      };
}
