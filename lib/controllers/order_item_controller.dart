import 'package:fooddelivery/models/order_item_list/order_item_list.dart';
import 'package:get/state_manager.dart';

class OrderListController extends GetxController {
  //get complete store access to manage @actions as well as list of products
  OrderItemListModel orderListStore = OrderItemListModel();
}
