import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/food_item_model/food_item_model.dart';

class DatabaseService {
  final firestoreInstance = FirebaseFirestore.instance;

  Future<List<FoodItemModel>> getAllProducts() async {
    List<FoodItemModel> foodItemList = <FoodItemModel>[];
    FoodItemModel foodItem;
    await firestoreInstance
        .collection('products')
        .get()
        .then((value) => value.docs.forEach((element) {
              //get a list of all docs then loop through each doc and add to list
              //if any change in model of products change here manually in pair value
              foodItem = FoodItemModel(
                  name: element.data()['name'],
                  price: element.data()['price'],
                  description: element.data()['description'],
                  id: element.data()['id']);
              foodItemList.add(foodItem);
            }));
    return foodItemList;
  }

  void addProduct(FoodItemModel foodItemModel) {
    int id = DateTime.now().microsecondsSinceEpoch;
    foodItemModel.id = "$id";
    firestoreInstance
        .collection('products')
        .doc('$id')
        .set(
          foodItemModel.toJson(),
        )
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }

  void updateProduct(FoodItemModel foodItemModel) {
    firestoreInstance
        .collection('products')
        .doc('${foodItemModel.id}')
        .update(
          foodItemModel.toJson(),
        )
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }

  void deleteProduct(FoodItemModel foodItemModel) {
    firestoreInstance
        .collection("products")
        .doc('${foodItemModel.id}')
        .delete()
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }

  //order section begin here
  Future<List<FoodItemModel>> getAllOrders() async {
    List<FoodItemModel> orderItemList = <FoodItemModel>[];
    FoodItemModel orderItem;
    await firestoreInstance
        .collection('products')
        .get()
        .then((value) => value.docs.forEach((element) {
              // foodItemModel.add(FoodItemModel.fromJson(element.data()));
              //data isn't in form of proper json so have to manually assign it here
              orderItem = FoodItemModel(
                  name: element.data()['name'],
                  price: element.data()['price'],
                  description: element.data()['description'],
                  id: element.data()['id']);
              orderItemList.add(orderItem);
            }));
    return orderItemList;
  }

  void addOrder(FoodItemModel foodItemModel) {
    //timestamp is to make id different for each order
    int id = DateTime.now().microsecondsSinceEpoch;

    firestoreInstance
        .collection('orders')
        .doc('$id')
        .set(
          foodItemModel.toJson(),
        )
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }

  void deleteOrder(FoodItemModel foodItemModel) {
    firestoreInstance
        .collection("orders")
        .doc('${foodItemModel.id}')
        .delete()
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }
}
