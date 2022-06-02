import 'package:mobx/mobx.dart';
import '../../services/db_service.dart';
import '../food_item_model/food_item_model.dart';

part 'order_item_list.g.dart';

class OrderItemListModel = OrderItemListModelBase with _$OrderItemListModel;

abstract class OrderItemListModelBase with Store {
  //all database tasks are managed here upon adding/deleting/updating orders
  final DatabaseService _databaseService = DatabaseService();

  @observable
  ObservableList<FoodItemModel> orderItems = ObservableList<FoodItemModel>();

  @action
  Future<void> fetchOrderItemsFromDatabase() async {
    final List<FoodItemModel> orderItemsList =
        await _databaseService.getAllOrders();
    orderItems.clear();
    orderItems.addAll(orderItemsList);
  }

  @action
  void addOrderItem(FoodItemModel foodItem) {
    _databaseService.addOrder(foodItem);
    orderItems.add(foodItem);
  }

  @action
  void removeOrderItem(FoodItemModel foodItem) {
    {
      _databaseService.deleteOrder(foodItem);
      orderItems.remove(foodItem);
    }
  }
}
