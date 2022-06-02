import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/food_item_controller.dart';
import '../../models/food_item_list_model/food_item_list_model.dart';
import '../../models/food_item_model/food_item_model.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage(this.foodItemModel, {Key? key}) : super(key: key);
  final FoodItemModel foodItemModel;
  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  FoodListController foodListController = Get.find(tag: 'foodListController');
  late FoodItemListModel store;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    store = foodListController.foodListStore;
    //assigining peviously saved values to the text fields in order to edit those values
    nameController.text = widget.foodItemModel.name;
    descriptionController.text = widget.foodItemModel.description;
    priceController.text = widget.foodItemModel.price;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Name"),
          ),
          TextField(
            controller: descriptionController,
            style: const TextStyle(color: Colors.black, fontSize: 12),
            decoration: const InputDecoration(hintText: "Description"),
          ),
          TextField(
            controller: priceController,
            decoration: const InputDecoration(hintText: "Price"),
          ),
          ElevatedButton(
              onPressed: () {
                store.updateFoodItem(FoodItemModel(
                  id: widget.foodItemModel.id,
                  name: nameController.text,
                  description: descriptionController.text,
                  price: '\$ ${priceController.text}',
                ));
                Get.back();
              },
              child: const Text("Update"))
        ],
      ),
    );
  }
}
