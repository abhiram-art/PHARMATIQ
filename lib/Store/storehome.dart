import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmatiq/Store/cart.dart';
import 'package:pharmatiq/Store/product_page.dart';
import 'package:pharmatiq/Store/searchBox.dart';
import 'package:pharmatiq/config.dart';
import 'package:pharmatiq/item.dart';
import 'package:pharmatiq/widgets/cartitemcounter.dart';
import 'package:pharmatiq/widgets/loadingwidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

double width;

class StoreHome extends StatefulWidget
{
  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome>
{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar (
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 170, 140, 1),
            ),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart,color: Colors.black,),
                  onPressed: ()
                  {
                    Route route = MaterialPageRoute(builder: (c) => CartPage());
                    Navigator.pushReplacement(context, route);
                  },
                ),
                Positioned(
                  child: Stack(
                    children: [
                      Icon(
                        Icons.brightness_1,
                        size: 20.0,
                        color: Colors.black,
                      ),
                      Positioned(
                        top: 3.0,
                        bottom: 4.0,
                        child: Consumer<CartItemCounter>(
                          builder: (context, counter, _)
                          {
                            return Text(
                              counter.count.toString(),
                              style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w500),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(pinned: true , delegate: SearchBoxDelegate()),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("Items").limit(15).orderBy("publishedDare", descending: true).snapshots(),
              builder: (context , dataSnapshot)
              {
                return !dataSnapshot.hasData
                    ? SliverToBoxAdapter(child: Center(child: circularProgress(),),)
                    : SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 1,
                  staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                  itemBuilder: (context , index)
                  {
                    ItemModel model =ItemModel.fromJson(dataSnapshot.data.documents[index].data);
                    return sourceInfo(model , context);
                  },
                  itemCount: dataSnapshot.data.documents.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
Widget sourceInfo(ItemModel model, BuildContext context,{Color background , removeCartFunction})
{
  return InkWell(
    onTap: ()
    {
      Route route = MaterialPageRoute(builder: (c) => ProductPage(itemModel: model));
      Navigator.pushReplacement(context, route);
    },
    splashColor: Colors.black,
    child: Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        height: 190.0,
        width: width,
        child: Row(
          children: [
            Image.network(model.thumbnailUrl , width: 140.0, height: 140.0,),
            SizedBox(width: 4.0,),
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
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.green
                        ),
                        alignment: Alignment.topLeft,
                        width: 40.0,
                        height: 43.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "50%",style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "OFF" ,style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0.0),
                            child: Row(
                              children: [
                                Text(
                                  r"Original Price: ₹",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.blueGrey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  (model.price + model.price).toString(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blueGrey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  r"New Price: ₹",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.blueGrey
                                  ),
                                ),
                                Text(
                                  (model.price + model.price).toString(),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: removeCartFunction == null
                        ? IconButton(
                      icon: Icon(Icons.add_shopping_cart , color:  Colors.green,),
                      onPressed: ()
                      {
                        checkItemInCart(model.shortInfo , context);
                      },
                    )
                        : IconButton(
                      icon: Icon(Icons.delete, color: Colors.green,), onPressed: () {

                    },
                    ),
                  ),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget card({Color primaryColor = Colors.redAccent, String imgPath}){
  return Container();
}

void checkItemInCart(String shortInfoAsId , BuildContext context)
{
  print(EcommerceApp.cartList);
  EcommerceApp.cartList.contains(shortInfoAsId)
      ? Fluttertoast.showToast(msg: "Item is already in Cart")
      : addItemToCart(shortInfoAsId, context);
}

addItemToCart(String shortInfoId, BuildContext context)
{
  List tempCartList = EcommerceApp.cartList;
  tempCartList.add(shortInfoId);

  Firestore.instance.collection("users")
      .document(EcommerceApp.userUID)
      .updateData({
    EcommerceApp.userCartList : tempCartList,
  }).then((v){
    Fluttertoast.showToast(msg: "Item Addd To Cart Successfully.");
    EcommerceApp.cartList = tempCartList;
    Provider.of<CartItemCounter>(context , listen: false).displayResult();
  });
}