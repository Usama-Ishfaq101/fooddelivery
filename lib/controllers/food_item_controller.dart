import 'package:fooddelivery/models/food_item_list_model/food_item_list_model.dart';
import 'package:get/state_manager.dart';

class FoodListController extends GetxController {
  //get complete store access to manage @actions as well as list of products
  FoodItemListModel foodListStore = FoodItemListModel();
}
