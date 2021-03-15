import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthdiary/infra/http/http_adapter.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../../../lib/application/protocols/http/http.dart';

class ClientSpy extends Mock implements Client {}

void main() {
  HttpAdapter sut;
  ClientSpy client;
  String url;

  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  group('get', () {
    PostExpectation mockRequest() =>
        when(client.get(any, headers: anyNamed('headers')));

    void mockResponse(int statusCode,
            {String body = '{"any_key":"any_value"}'}) =>
        mockRequest().thenAnswer((_) async => Response(body, statusCode));

    void mockError() => mockRequest().thenThrow(Exception());

    setUp(() {
      mockResponse(200);
    });

    test('Should call with correct values', () async {
      await sut.request(url: url, method: 'get');
      verify(client.get(Uri.parse(url), headers: {
        'content-type': 'application/json',
        'accept': 'application/json'
      }));

      await sut.request(
          url: url, method: 'get', headers: {'any_header': 'any_value'});
      verify(client.get(Uri.parse(url), headers: {
        'any_header': 'any_value',
        'content-type': 'application/json',
        'accept': 'application/json'
      }));
    });

    test('Should return data if get returns 200', () async {
      final response = await sut.request(url: url, method: 'get');

      expect(response, {'any_key': 'any_value'});
    });

    test('Should return ServerError if get returns 500', () async {
      mockResponse(500);

      final future = sut.request(url: url, method: 'get');

      expect(future, throwsA(HttpError.serverError.toString()));
    });

    test('Should return null if get returns 204', () async {
      mockResponse(204, body: '');

      final response = await sut.request(url: url, method: 'get');

      expect(response, null);
    });

    test('Should return ServerError if get throws', () async {
      mockError();

      final future = sut.request(url: url, method: 'get');

      expect(future, throwsA(HttpError.serverError.toString()));
    });
  });
}
