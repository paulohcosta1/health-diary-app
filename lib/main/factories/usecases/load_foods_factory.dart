import 'package:healthdiary/application/usecases/load_foods/remote_load_foods.dart';
import 'package:healthdiary/domain/usecases/load_foods.dart';
import 'package:healthdiary/main/factories/http/api_url_factory.dart';
import 'package:healthdiary/main/factories/http/http_client_factory.dart';

LoadFoods makeRemoteLoadFoods() =>
    RemoteLoadFoods(httpClient: makeHttpAdapter(), url: makeApiUrl('surveys'));
