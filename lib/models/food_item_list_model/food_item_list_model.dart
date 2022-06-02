import 'package:fooddelivery/services/db_service.dart';
import 'package:mobx/mobx.dart';
import '../food_item_model/food_item_model.dart';

part 'food_item_list_model.g.dart';

class FoodItemListModel = FoodItemListModelBase with _$FoodItemListModel;

abstract class FoodItemListModelBase with Store {
  //all database tasks are managed here upon adding/deleting/updating products
  final DatabaseService _databaseService = DatabaseService();

  @observable
  ObservableList<FoodItemModel> foodItems = ObservableList<FoodItemModel>();

  @action
  Future<void> fetchProductsFromDatabase() async {
    final List<FoodItemModel> foodItemsList =
        await _databaseService.getAllProducts();
    foodItems.clear();
    foodItems.addAll(foodItemsList);
  }

  @action
  void addFoodItem(FoodItemModel foodItem) {
    _databaseService.addProduct(foodItem);
    foodItems.add(foodItem);
  }

  @action
  void removeFoodItem(FoodItemModel foodItem) {
    foodItems.remove(foodItem);
    _databaseService.deleteProduct(foodItem);
  }

  @action
  void updateFoodItem(FoodItemModel foodItem) {
    _databaseService.updateProduct(foodItem); //adding to database
    for (var item in foodItems) {
      //working in O(n)
      if (item.id == foodItem.id) {
        foodItems.remove(item); //working in O(n)
        foodItems.add(foodItem);
      }
    }
  }
}
