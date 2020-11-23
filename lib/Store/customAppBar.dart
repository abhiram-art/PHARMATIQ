import 'package:pharmatiq/Store/cart.dart';
import 'package:flutter/material.dart';
import 'package:pharmatiq/Store/storehome.dart';
import 'package:pharmatiq/config.dart';
import 'package:pharmatiq/screens/homedesign.dart';
import 'package:pharmatiq/widgets/cartitemcounter.dart';
import 'package:provider/provider.dart';


class MyAppBar extends StatelessWidget with PreferredSizeWidget
{
  final PreferredSizeWidget bottom;
  MyAppBar({this.bottom});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading:GestureDetector(
        onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DashboardPage()));},
        child: Icon(
          Icons.arrow_back,
        ),
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
      flexibleSpace: Container(
        decoration: new BoxDecoration(
          color: Color.fromRGBO(0, 170, 140, 1),
        ),
      ),
      centerTitle: true,
      title: Text(
        "Pharmatiq",
        style: TextStyle(fontSize: 28.0 , color: Colors.white , fontFamily: "Signatra"),
      ),
      bottom: bottom,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart,color: Colors.white,),
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
                    size:20.0,
                    color:Colors.white,
                  ),
                  Positioned(
                    top: 3.0,
                    bottom: 4.0,
                    left: 7.0,
                    child:Consumer<CartItemCounter>(
                      builder:(context,counter,_){
                        return Text(
                          ((EcommerceApp.cartList).length - 1).toString(),
                          style: TextStyle(color:Colors.black,fontSize: 12.0, fontWeight: FontWeight.bold),
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
    );
  }


  Size get preferredSize => bottom==null?Size(56,AppBar().preferredSize.height):Size(56, 80+AppBar().preferredSize.height);
}