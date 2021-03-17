import 'package:healthdiary/application/protocols/http/http.dart';
import 'package:healthdiary/infra/http/http_adapter.dart';
import 'package:http/http.dart';

HttpClient makeHttpAdapter() => HttpAdapter(Client());
