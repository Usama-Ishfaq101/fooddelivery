import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fooddelivery/views/update_product/update_product.dart';
import 'package:get/get.dart';

import '../../controllers/food_item_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  FoodListController foodListController = Get.find(tag: 'foodListController');
  late var store;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store = foodListController.foodListStore;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
          itemCount: store.foodItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(store.foodItems[index].name),
                    subtitle: Text(store.foodItems[index].description),
                    trailing: Text(store.foodItems[index].price),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            store.removeFoodItem(store.foodItems[index]);
                          },
                          child: const Text("Remove")),
                      ElevatedButton(
                          onPressed: () =>
                              Get.to(UpdateProductPage(store.foodItems[index])),
                          child: const Text("Update")),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
