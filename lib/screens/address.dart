import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmatiq/Orders/placeOrderPayment.dart';
import 'package:pharmatiq/config.dart';
import 'package:pharmatiq/Store/customAppBar.dart';
import 'package:pharmatiq/widgets/changeAddress.dart';
import 'package:pharmatiq/widgets/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:pharmatiq/widgets/wideButton.dart';
import 'package:provider/provider.dart';

import 'addAddress.dart';


class AddressModel{
  String name;
  String phoneNumber;
  String flatNumber;
  String city;
  String state;
  String pinCode;

  AddressModel(
        {
          this.name,
          this.phoneNumber,
          this.flatNumber,
          this.city,
          this.state,
          this.pinCode
        }
      );

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    flatNumber = json['flatNumber'];
    city = json['city'];
    state = json['state'];
    pinCode = json['pinCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['flatNumber'] = this.flatNumber;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pinCode'] = this.pinCode;
    return data;
  }
}

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Text(
                  "Select Address",
                  style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            Consumer<AddressChanger>(builder: (context,address,c){
              return Flexible(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("users")
                    .document(EcommerceApp.userUID)
                    .collection(EcommerceApp.subCollectionAddress).snapshots(),

                    builder: (context,snapshot)
                    {
                      return !snapshot.hasData
                          ?Center(child: circularProgress(),)
                          : snapshot.data.documents.length == 0
                          ? noAddressCard()
                          : ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context,index)
                        {
                          return AddressCard(
                            currentIndex: address.count,
                            value: index,
                            addressId: snapshot.data.documents[index].documentID,
                            totalAmount: widget.totalAmount,
                            model: AddressModel.fromJson(snapshot.data.documents[index].data),
                          );
                        },
                      );


                    },
                  ),
              );
            }),

          ],
        ),
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
      color: Colors.green,
      child: Container(
        height: 100.0,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_location, color: Colors.white,),
            Text("No shipment address has been saved."),
            Text("Please add your shipment Adress so that we can deliver product.")


          ],
        ),
      ),

    );
  }
}


class AddressCard extends StatefulWidget {

  final AddressModel model;
  final String addressId;
  final double totalAmount;
  final int currentIndex;
  final int value;

  AddressCard({Key key , this.model , this.currentIndex , this.addressId, this.totalAmount , this.value}) : super(key : key);
  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ()
      {
         Provider.of<AddressChanger>(context,listen:false).displayResult(widget.value);
      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  groupValue: widget.currentIndex,
                  value: widget.value,
                  activeColor: Colors.green,
                  onChanged: (val)
                  {
                    Provider.of<AddressChanger>(context,listen: false).displayResult(val);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: screenwidth * 0.8,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                                KeyText(msg: "Name",),
                              Text(widget.model.name),
                            ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "Phone Number",),
                                Text(widget.model.phoneNumber),
                              ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "Flat Number",),
                                Text(widget.model.flatNumber),
                              ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "City",),
                                Text(widget.model.city),
                              ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "State",),
                                Text(widget.model.state),
                              ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "Pin Code",),
                                Text(widget.model.pinCode),
                              ]
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            widget.value == Provider.of<AddressChanger>(context).count
            ? WideButton(
              message: "Proceed",
              onPressed: ()
              {
                Route route = MaterialPageRoute(builder: (c) => PlaceOrder(
                  addressId: widget.addressId,
                  totalAmount: widget.totalAmount,
                ));
                Navigator.push(context,route);
              },
            )
                :Container(),
          ],
        ),
      ),

    );
  }
}





class KeyText extends StatelessWidget {
  final String msg;
  KeyText({Key key , this.msg}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
    );
  }
}