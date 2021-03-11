import 'package:healthdiary/application/models/remote_food_model.dart';
import 'package:healthdiary/application/protocols/http/http.dart';
import 'package:healthdiary/domain/errors/domain_error.dart';
import 'package:meta/meta.dart';
import 'package:healthdiary/domain/entities/entities.dart';
import 'package:healthdiary/domain/usecases/usecases.dart';

class RemoteLoadFoods implements LoadFoods {
  final String url;
  final HttpClient httpClient;

  RemoteLoadFoods({@required this.url, @required this.httpClient});

  Future<List<FoodEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse
          .map<FoodEntity>((json) => RemoteFoodModel.fromJson(json).toEntity())
          .toList();
    } on HttpError catch (error) {
      throw DomainError.unexpected;
    }
  }
}
