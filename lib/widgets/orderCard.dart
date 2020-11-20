import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmatiq/Orders/OrderDetailsPage.dart';
import 'package:pharmatiq/Store/storehome.dart';
import 'package:pharmatiq/item.dart';

int counter = 0;
class OrderCard extends StatelessWidget
{
  final int itemCount;
  final List<DocumentSnapshot> data;
  final String orderId;
  OrderCard({Key key , this.itemCount, this.data , this.orderId}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Route route;
        if(counter == 0)
          {
            counter += 1;
            route = MaterialPageRoute(builder: (c) => OrderDetails(orderId : orderId));
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

  Widget sourceOrderInfo(ItemModel model , BuildContext context,
  {Color background})
  {
    width = MediaQuery.of(context).size.width;

    return Container(
      height: 170.0,
      width: width,
      color: Colors.grey[100],

      child: Row(
        children: [
          Image.network(model.thumbnailUrl , width: 180.0,),
          SizedBox(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.0,),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max ,
                    children: [
                      Expanded(
                        child: Text(model.title , style: TextStyle(color: Colors.white , fontSize: 14.0),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0,),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max ,
                    children: [
                      Expanded(
                        child: Text(model.shortInfo , style: TextStyle(color: Colors.blueGrey, fontSize: 12.0),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Text(
                                r"Total Price: ₹",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.blueGrey
                                ),
                              ),
                              Text(
                                (model.price).toString(),
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.blueGrey
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Flexible(
                  child: Container(

                  ),
                ),
                //to implement the cart item remove feature
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}