import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget
{
  final TextEditingController controller;
  final IconData data;
  final String hintText;
  bool isObsecure = true;


  CustomTextField(
        {Key key, this.controller,this.data,this.hintText,this.isObsecure}
      ) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container
      (
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 170, 140, 1),
                //blurRadius: 20.0,
                //offset: Offset(0, 10)
            )
          ]
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        decoration: InputDecoration(
          border: InputBorder.none,
            prefixIcon: Icon(
              data,
              color: Theme.of(context).primaryColor,
            ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
        ),
      ),
    );
  }
}