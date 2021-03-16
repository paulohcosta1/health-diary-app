import 'package:flutter/material.dart';
import './load_food.dart';

class LoadFoodPage extends StatelessWidget {
  final LoadFoodPresenter presenter;
  LoadFoodPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reconcha'),
      ),
    );
  }
}
