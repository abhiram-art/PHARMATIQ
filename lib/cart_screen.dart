import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmatiq/widgets/my_button.dart';
import 'package:pharmatiq/orders.dart';
import 'package:pharmatiq/widgets/NavDrawer.dart';
import 'package:pharmatiq/widgets/my_button.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'cart_item.dart';
import 'payment.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer:NavDrawer(),
      appBar: AppBar(
        //title: Text('PHARMATIq',style:GoogleFonts.ptSansCaption(textStyle:TextStyle(color: Colors.white),fontWeight:FontWeight.w500,fontSize: 27.0)),backgroundColor: Color.fromRGBO(0, 170, 140, 1),
       title: Text(
          'My Cart',
         style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name)),
          ),
          //CheckoutButton(
            //cart: cart,
          //),
          // FlatButton(
          //     onPressed: () {
          //     },
          //     child: Text(
          //       'Checkout',
          //       style: TextStyle(color: Colors.blue, fontSize: 20),
          //     ))
        ],
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
     return Container(
         child: MyButton(
      name:"Check Out",
        onPressed: (){
      Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()));
      },

      //FlatButton(
      //child: Text('Checkout'),
      //onPressed: (){
        //Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()));
      //}
    ));
    //);
  }
}
