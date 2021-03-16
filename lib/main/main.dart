import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healthdiary/main/factories/pages/load_food/load_food_page_factory.dart';

void main() {
  runApp(HDApp());
}

class HDApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      title: 'Health Diary App',
      initialRoute: '/',
      navigatorObservers: [routeObserver],
      getPages: [GetPage(name: '/', page: makeLoadFoodPage)],
    );
  }
}
