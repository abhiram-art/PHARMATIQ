import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmatiq/config.dart';
//import 'package:pharmatiq/placeOrder.dart';
import 'package:pharmatiq/Store/customAppBar.dart';
import 'package:pharmatiq/widgets/loadingWidget.dart';
//import 'package:pharmatiq/widgets/wideButton.dart';
import 'package:pharmatiq/screens/address.dart';
//import 'package:pharmatiq/changeAddresss.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addAddress.dart';

class Address extends StatefulWidget
{
  final double totalAmount;
  const Address({Key key,this.totalAmount}) : super(key: key);
  @override
  _AddressState createState() => _AddressState();
}


class _AddressState extends State<Address>
{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Add New Address"),
          backgroundColor: Colors.green,
          icon : Icon(Icons.add_location),
          onPressed: ()
          {
            Route route = MaterialPageRoute(builder: (c) => AddAddress());
            Navigator.pushReplacement(context, route);
          },
        ),
      )

    );
  }

  noAddressCard() {
    return Card(

    );
  }
}

class AddressCard extends StatefulWidget {

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {

    return InkWell(

    );
  }
}





class KeyText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}