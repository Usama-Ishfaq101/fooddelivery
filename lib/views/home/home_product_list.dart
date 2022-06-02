import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../../controllers/food_item_controller.dart';
import '../../controllers/order_item_controller.dart';
import '../../models/food_item_list_model/food_item_list_model.dart';
import '../../models/order_item_list/order_item_list.dart';

class HomeProductList extends StatefulWidget {
  const HomeProductList({Key? key}) : super(key: key);

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {
  FoodListController foodListController = Get.find(tag: 'foodListController');
  OrderListController orderListController =
      Get.find(tag: 'orderListController');
  late FoodItemListModel store;
  late OrderItemListModel order;
  @override
  void initState() {
    super.initState();

    store = foodListController.foodListStore;
    order = orderListController.orderListStore;
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
                    // tileColor: Colors.blue,object
                    title: Text(store.foodItems[index].name),
                    subtitle: Text(store.foodItems[index].description),
                    trailing: Text(store.foodItems[index].price),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      order.addOrderItem(store.foodItems[index]);
                    },
                    child: const Text("Add to Cart"),
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
