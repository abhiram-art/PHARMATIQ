import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:pharmatiq/Store/storehome.dart';
import 'package:pharmatiq/config.dart';
import 'package:pharmatiq/Store/customAppBar.dart';
import 'package:pharmatiq/screens/address.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final cName = TextEditingController();
  final cPhoneNumber = TextEditingController();
  final cFlatHomeNumber = TextEditingController();
  final cCity = TextEditingController();
  final cState = TextEditingController();
  final cPinCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: MyAppBar(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: ()
          {
             if(formKey.currentState.validate())
               {
                 final model = AddressModel(
                   name: cName.text.trim(),
                   state: cState.text.trim(),
                   pinCode: cPinCode.text,
                   phoneNumber: cPhoneNumber.text.trim(),
                   flatNumber: cFlatHomeNumber.text.trim(),
                   city: cCity.text.trim(),
                 ).toJson();

                 Firestore.instance.collection("users")
                     .document(EcommerceApp.userUID)
                     .collection(EcommerceApp.subCollectionAddress)
                     .document(DateTime.now().millisecondsSinceEpoch.toString())
                     .setData(model)
                     .then((value) {
                         final snack = SnackBar(content: Text("New Address added successfully"));
                         scaffoldKey.currentState.showSnackBar(snack);
                         FocusScope.of(context).requestFocus(FocusNode());
                         formKey.currentState.reset();
                 });
                 Route route = MaterialPageRoute(builder: (c) => StoreHome());
                 Navigator.pushReplacement(context, route);
               }
          },
          label: Text("Done"),
          backgroundColor: Colors.green,
          icon: Icon(Icons.check),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    "Add New Address",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.0)
                    ),
                     MyTextField(
                       hint: "Name - ",
                       controller: cName,
                     ),
                    SizedBox(height: 10,),
                    MyTextField(
                      hint: "Phone Number - ",
                      controller: cPhoneNumber,
                    ),
                    SizedBox(height: 10,),
                    MyTextField(
                      hint: "House Number -",
                      controller: cFlatHomeNumber,
                    ),
                    SizedBox(height: 10,),
                    MyTextField(
                      hint: "City -",
                      controller: cCity,
                    ),
                    SizedBox(height: 10,),
                    MyTextField(
                      hint: "State -",
                      controller: cState,
                    ),
                    SizedBox(height: 10,),
                    MyTextField(
                      hint: "Pin Code -",
                      controller: cPinCode,
                    ),
                    SizedBox(height: 10,),
                  ],
                )
              )
            ],
          )
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  MyTextField({Key key , this.hint , this.controller}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.all(15.0),
      child: TextFormField(

        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ,fontSize: 20.0 ),
        controller: controller,
        decoration:
        InputDecoration.collapsed(
          hintText: hint ,
          filled: true ,
          fillColor: Colors.grey.withOpacity(0.2) ,
          //contentPadding: EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        validator: (val) => val.isEmpty ? "Field cannot be empty." : null,
      ),
    );
  }
}