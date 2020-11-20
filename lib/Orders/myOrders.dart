import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmatiq/config.dart';
import 'package:pharmatiq/widgets/loadingwidget.dart';
import 'package:pharmatiq/widgets/orderCard.dart';

class MyOrders extends StatefulWidget
{
  @override
  _MyOrdersState createState() => _MyOrdersState();

}

class _MyOrdersState extends State<MyOrders> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           appBar: AppBar(
             iconTheme: IconThemeData(color: Colors.white),
             flexibleSpace: Container(
               decoration: new BoxDecoration(
                 color: Color.fromRGBO(0, 170, 140, 1),
               ),
             ),
             centerTitle: true,
             title: Text("My Orders" , style: TextStyle(color: Colors.white),),
             actions: [
               IconButton(
                   icon: Icon(Icons.arrow_drop_down_circle,color: Colors.white,),
                   onPressed: ()
                   {
                       SystemNavigator.pop();
                   },

               ),
             ],

           ),
          body: StreamBuilder<QuerySnapshot> (
            stream: Firestore.instance
                .collection("users")
                .document(EcommerceApp.userUID)
                .collection(EcommerceApp.collectionOrders).snapshots(),
            builder: (c , snapshot)
            {
              return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (c , index)
                {
                   return FutureBuilder<QuerySnapshot>(
                     future: Firestore.instance
                         .collection("Items")
                         .where("shortInfo" , whereIn:  snapshot.data.documents[index].data[EcommerceApp.productID])
                         .getDocuments(),

                     builder: (c , snap)
                     {
                       return snap.hasData
                           ? OrderCard(
                            itemCount: snap.data.documents.length,
                            data: snap.data.documents,
                            orderId: snapshot.data.documents[index].documentID,
                       )
                           : Center(child: circularProgress(),);
                     },
                   );
                },
            )
                  :Center(child: circularProgress(),);
            },
          ),
        )
    );


  }


}