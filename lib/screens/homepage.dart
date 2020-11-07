import 'package:pharmatiq/widgets/cartitemcounter.dart';
import 'package:flutter/material.dart';
import 'package:pharmatiq/models/cart.dart';
import 'package:pharmatiq/widgets/home_body.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(),
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Text('Flutter E-com'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, size: 30,color: Colors.black,),
                onPressed: ()
                {
                  Route route = MaterialPageRoute(builder: (c) => CartScreen());
                  Navigator.pushReplacement(context, route);
                },
              ),
              Positioned(
                child: Stack(
                  children: [
                    Icon (
                      Icons.brightness_1,
                      size: 20.0,
                      color: Colors.green,
                    ),
                    Positioned(
                      top: 3.0,
                      bottom: 4.0,
                      child: Consumer<CartItemCounter>(
                        builder: (context , counter , _)
                        {
                          return Text(
                            counter.count.toString(),
                            style: TextStyle(color: Colors.white ,fontSize: 12.0 ,fontWeight: FontWeight.w500),
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
      body: HomeBody()
    );
  }
}
