import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../application/protocols/http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  Future<dynamic> request(
      {@required String url,
      @required String method,
      Map body,
      Map headers}) async {
    var uri = Uri.parse(url);

    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});

    var response = Response('', 500);
    Future<Response> futureResponse;

    try {
      if (method == 'get') {
        futureResponse = client.get(uri, headers: defaultHeaders);
      }

      if (futureResponse != null) {
        response = await futureResponse.timeout(Duration(seconds: 10));
      }
    } catch (err) {
      throw describeEnum(HttpError.serverError);
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw describeEnum(HttpError.badRequest);
      case 401:
        throw describeEnum(HttpError.unauthorized);
      case 403:
        throw describeEnum(HttpError.forbidden);
      case 404:
        throw describeEnum(HttpError.notFound);
      default:
        throw describeEnum(HttpError.serverError);
    }
  }
}
