import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../../controllers/order_item_controller.dart';
import '../../models/order_item_list/order_item_list.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  OrderListController orderListController =
      Get.find(tag: 'orderListController');
  late OrderItemListModel order;
  @override
  void initState() {
    super.initState();
    order = orderListController.orderListStore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            order.orderItems.isEmpty
                ? const Text("Curently no orders are placed")
                : const Text("Curent orders are:"),
            Observer(builder: (_) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: order.orderItems.length,
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
                            // tileColor: Colors.blue,
                            title: Text(order.orderItems[index].name),
                            subtitle: Text(order.orderItems[index].description),
                            trailing: Text(order.orderItems[index].price),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                order.removeOrderItem(order.orderItems[index]);
                              },
                              child: const Text("Remove Item")),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
