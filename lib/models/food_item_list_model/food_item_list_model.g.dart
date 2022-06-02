// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item_list_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodItemListModel on FoodItemListModelBase, Store {
  late final _$foodItemsAtom =
      Atom(name: 'FoodItemListModelBase.foodItems', context: context);

  @override
  ObservableList<FoodItemModel> get foodItems {
    _$foodItemsAtom.reportRead();
    return super.foodItems;
  }

  @override
  set foodItems(ObservableList<FoodItemModel> value) {
    _$foodItemsAtom.reportWrite(value, super.foodItems, () {
      super.foodItems = value;
    });
  }

  late final _$fetchProductsFromDatabaseAsyncAction = AsyncAction(
      'FoodItemListModelBase.fetchProductsFromDatabase',
      context: context);

  @override
  Future<void> fetchProductsFromDatabase() {
    return _$fetchProductsFromDatabaseAsyncAction
        .run(() => super.fetchProductsFromDatabase());
  }

  late final _$FoodItemListModelBaseActionController =
      ActionController(name: 'FoodItemListModelBase', context: context);

  @override
  void addFoodItem(FoodItemModel foodItem) {
    final _$actionInfo = _$FoodItemListModelBaseActionController.startAction(
        name: 'FoodItemListModelBase.addFoodItem');
    try {
      return super.addFoodItem(foodItem);
    } finally {
      _$FoodItemListModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFoodItem(FoodItemModel foodItem) {
    final _$actionInfo = _$FoodItemListModelBaseActionController.startAction(
        name: 'FoodItemListModelBase.removeFoodItem');
    try {
      return super.removeFoodItem(foodItem);
    } finally {
      _$FoodItemListModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFoodItem(FoodItemModel foodItem) {
    final _$actionInfo = _$FoodItemListModelBaseActionController.startAction(
        name: 'FoodItemListModelBase.updateFoodItem');
    try {
      return super.updateFoodItem(foodItem);
    } finally {
      _$FoodItemListModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foodItems: ${foodItems}
    ''';
  }
}
