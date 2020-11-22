import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmatiq/Store/storehome.dart';
import 'file:///C:/Users/asrit/AndroidStudioProjects/pharmatiq/lib/Orders/adminOrderDetails.dart';
import 'package:pharmatiq/widgets/orderCard.dart';

import '../item.dart';


int counter=0;
class AdminOrderCard extends StatelessWidget
{
  final int itemCount;
  final List<DocumentSnapshot> data;
  final String orderId;
  final String addressId;
  final String orderBy;

  AdminOrderCard({Key key,this.itemCount,this.data,this.orderId,this.addressId,this.orderBy}) : super(key : key);
  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: ()
      {
        Route route;
        if(counter == 0)
        {
          counter += 1;
          route = MaterialPageRoute(builder: (c) => AdminOrderDetails(orderId : orderId, orderBy : orderBy, addressId : addressId,));
        }
        Navigator.push(context, route);
      },
      child: Container(
        decoration: new BoxDecoration(
          color: Color.fromRGBO(0, 170, 140, 1),
        ),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        height: itemCount * 190.0,
        child: ListView.builder(
          itemCount: itemCount,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (c , index)
          {
            ItemModel model = ItemModel.fromJson(data[index].data);
            return sourceOrderInfo(model , context);
          },
        ),
      ),
    );
  }
}

