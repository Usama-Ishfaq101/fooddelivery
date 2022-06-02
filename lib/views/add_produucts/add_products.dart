import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/food_item_controller.dart';
import '../../models/food_item_list_model/food_item_list_model.dart';
import '../../models/food_item_model/food_item_model.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  FoodListController foodListController = Get.find(tag: 'foodListController');
  late FoodItemListModel store;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    store = foodListController.foodListStore;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(30),
        color: Colors.grey,
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: "Description"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(hintText: "Price"),
            ),
            ElevatedButton(
                onPressed: () {
                  String id = DateTime.now().millisecond.toString();
                  store.addFoodItem(FoodItemModel(
                    id: id,
                    name: nameController.text,
                    description: descriptionController.text,
                    price: '\$ ${priceController.text}',
                  ));

                  Get.back();
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
