import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthdiary/ui/pages/load_food/load_food_viewmodel.dart';
import 'package:provider/provider.dart';
import './load_food.dart';

class LoadFoodPage extends StatefulWidget {
  final LoadFoodPresenter presenter;
  LoadFoodPage(this.presenter);

  @override
  _LoadFoodPageState createState() => _LoadFoodPageState();
}

class _LoadFoodPageState extends State<LoadFoodPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    Get.find<RouteObserver>().subscribe(this, ModalRoute.of(context));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Selecione os alimentos",
        ),
      ),
      body: Builder(
        builder: (context) {
          widget.presenter.loadData();

          return StreamBuilder<List<LoadFoodViewModel>>(
              stream: widget.presenter.foodsResultStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container(
                    child: Text("erro"),
                  );
                }
                if (snapshot.hasData) {
                  return Provider(
                    create: (_) => widget.presenter,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.black,
                            ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return new ListTile(
                            title: Text(snapshot.data[index].name),
                          );
                        }),
                  );
                }
                return SizedBox(height: 0);
              });
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.find<RouteObserver>().unsubscribe(this);
    super.dispose();
  }
}
