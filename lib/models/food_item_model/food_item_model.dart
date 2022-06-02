import 'package:mobx/mobx.dart';

part 'food_item_model.g.dart';

class FoodItemModel = FoodItemModelBase with _$FoodItemModel;

abstract class FoodItemModelBase with Store {
  late String id;
  @observable
  late String name;
  @observable
  late String description;
  @observable
  late String price;

  FoodItemModelBase({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  FoodItemModelBase.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }

  //gets object and convert into json used for saving to firebase
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    return _data;
  }
}
