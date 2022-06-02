// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderItemListModel on OrderItemListModelBase, Store {
  late final _$orderItemsAtom =
      Atom(name: 'OrderItemListModelBase.orderItems', context: context);

  @override
  ObservableList<FoodItemModel> get orderItems {
    _$orderItemsAtom.reportRead();
    return super.orderItems;
  }

  @override
  set orderItems(ObservableList<FoodItemModel> value) {
    _$orderItemsAtom.reportWrite(value, super.orderItems, () {
      super.orderItems = value;
    });
  }

  late final _$fetchOrderItemsFromDatabaseAsyncAction = AsyncAction(
      'OrderItemListModelBase.fetchOrderItemsFromDatabase',
      context: context);

  @override
  Future<void> fetchOrderItemsFromDatabase() {
    return _$fetchOrderItemsFromDatabaseAsyncAction
        .run(() => super.fetchOrderItemsFromDatabase());
  }

  late final _$OrderItemListModelBaseActionController =
      ActionController(name: 'OrderItemListModelBase', context: context);

  @override
  void addOrderItem(FoodItemModel foodItem) {
    final _$actionInfo = _$OrderItemListModelBaseActionController.startAction(
        name: 'OrderItemListModelBase.addOrderItem');
    try {
      return super.addOrderItem(foodItem);
    } finally {
      _$OrderItemListModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeOrderItem(FoodItemModel foodItem) {
    final _$actionInfo = _$OrderItemListModelBaseActionController.startAction(
        name: 'OrderItemListModelBase.removeOrderItem');
    try {
      return super.removeOrderItem(foodItem);
    } finally {
      _$OrderItemListModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderItems: ${orderItems}
    ''';
  }
}
