import 'package:flutter/material.dart';
import 'package:healthdiary/main/factories/pages/load_food/load_food_presenter_factory.dart';
import 'package:healthdiary/ui/pages/load_food/load_food_page.dart';

Widget makeLoadFoodPage() => LoadFoodPage(makeGetxSurveysPresenter());
