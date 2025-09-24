import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/features/shop/models/orderModel.dart';
import 'package:online_shop/utile/const/keys.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  // save user order to db
  Future<void> saveOrder(OrderModel order)async{
    try{
      await _db.collection(MyKeys.userCollection).doc(order.userId).collection(MyKeys.orderCollection).add(order.toJson());
    }catch(e){
      throw 'Something went wrong while saving order info';
    }
  }

  // get user order
  Future<List<OrderModel>> fetchUserOrder()async{
    try{
      final userId = AuthenticationRepository.instance.currentUser!.uid;

      // if user doesn't exist
      if(userId.isEmpty) throw "Unable to find user information";

      final query = await _db.collection(MyKeys.userCollection).doc(userId).collection(MyKeys.orderCollection).get();
      if(query.docs.isNotEmpty){
        List<OrderModel> orders = query.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
        return orders;
      }
      return [];

    }catch(e){
      throw "Something went wrong while order info...";
    }

  }
}