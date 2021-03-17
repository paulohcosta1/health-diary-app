import 'package:flutter/foundation.dart';
import 'package:healthdiary/application/models/remote_food_answer_model.dart';
import 'package:healthdiary/application/protocols/http/http.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class RemoteFoodModel {
  final List<RemoteFoodAnswerModel> result;

  RemoteFoodModel({
    @required this.result,
  });

  factory RemoteFoodModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['result'])) {
      throw HttpError.invalidData;
    }

    return RemoteFoodModel(
      result: json['result']
          .map<RemoteFoodAnswerModel>(
              (answerJson) => RemoteFoodAnswerModel.fromJson(answerJson))
          .toList(),
    );
  }
}
