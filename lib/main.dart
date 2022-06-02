import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/food_item_controller.dart';
import 'controllers/order_item_controller.dart';
import 'models/food_item_list_model/food_item_list_model.dart';
import 'views/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setController(); //making product/order items available to all screens
  addProduct(); //this fetch products from database if they exists already
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

Future<void> addProduct() async {
  FoodListController foodListController = Get.find(tag: 'foodListController');
  FoodItemListModel store = foodListController.foodListStore;
  await store.fetchProductsFromDatabase();
}

void setController() {
  Get.put(FoodListController(), tag: 'foodListController');
  Get.put(OrderListController(), tag: 'orderListController');
}
