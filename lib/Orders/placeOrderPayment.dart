import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmatiq/config.dart';
import 'package:pharmatiq/Store/storehome.dart';
import 'package:pharmatiq/widgets/cartitemcounter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceOrder extends StatefulWidget{
  final String addressId;
  final double totalAmount;

  PlaceOrder({Key key , this.addressId , thi, this.totalAmount}) : super(key: key);

  @override
_PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder>{
  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          color: Color.fromRGBO(0, 170, 140, 1),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Image.asset("images/cod1.png"),
              ),
              SizedBox(height: 10.0,),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.all(0.0),
                splashColor: Color.fromRGBO(0, 170, 140, 1),
                onPressed: () => addOrderDetails(),
                child: Text("Place Order" , style: TextStyle(fontSize: 30.0),),
              )
            ],
          ),
        ),
      )
    );

  }
  
  addOrderDetails()
  {
    writeOrderDetailsForUser({
      EcommerceApp.addressID: widget.addressId,
      EcommerceApp.totalAmount: widget.totalAmount,
      "orderBy": EcommerceApp.userUID,
      EcommerceApp.productID: EcommerceApp.cartList,
      EcommerceApp.paymentDetails: "Cash on Delivery",
      EcommerceApp.orderTime: DateTime.now().millisecondsSinceEpoch.toString(),
      EcommerceApp.isSuccess: true,
    });

    writeOrderDetailsForAdmin({
      EcommerceApp.addressID: widget.addressId,
      EcommerceApp.totalAmount: widget.totalAmount,
      "orderBy": EcommerceApp.userUID,
      EcommerceApp.productID: EcommerceApp.cartList,
      EcommerceApp.paymentDetails: "Cash on Delivery",
      EcommerceApp.orderTime: DateTime.now().millisecondsSinceEpoch.toString(),
      EcommerceApp.isSuccess: true,
    }).whenComplete(() => {
      emptyCartNow()
    });
  }

  emptyCartNow()
  {
    EcommerceApp.cartList =  ["garbageValue"];
    List tempList = EcommerceApp.cartList;

    Firestore.instance.collection("users").document(EcommerceApp.userUID).updateData
      ({
      EcommerceApp.userCartList: tempList,
    }).then((value) {
      EcommerceApp.cartList = tempList;
      Provider.of<CartItemCounter> (context, listen: false).displayResult();
    });
    Fluttertoast.showToast(msg: "Congratulations, Your order has been placed successfully.");

    Route route = MaterialPageRoute(builder: (c) => StoreHome());
    Navigator.pushReplacement(context, route);
  }

  Future writeOrderDetailsForUser(Map<String , dynamic> data) async
  {
    await Firestore.instance.collection("users")
        .document(EcommerceApp.userUID)
        .collection(EcommerceApp.collectionOrders)
        .document((EcommerceApp.userUID) + data['orderTime'])
        .setData(data);
  }

  Future writeOrderDetailsForAdmin(Map<String , dynamic> data) async
  {
    await Firestore.instance.collection(EcommerceApp.collectionOrders)
        .document((EcommerceApp.userUID) + data['orderTime'])
        .setData(data);
  }
}
