import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmatiq/authentication.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pharmatiq/screens/intro.dart';

import 'intro.dart';

class SignHome extends StatefulWidget{
  @override
  _SignHomeState createState() => _SignHomeState();
}

class _SignHomeState extends State<SignHome> {
  String email;
  String password;
  String confirmpassword;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void handleSignup() {
    signUp(email, password, context).then((value) {
      if (value != null) {
        saveUserInfoToFireStore(value).then((value){
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Intro(),
            ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/white1.jpg'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(

                          margin: EdgeInsets.only(top: 250),
                          child: Center(
                              child: Text("Signup",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 170,140, 1),
                                      blurRadius: 20.0,
                                      offset: Offset(0,10)
                                  )
                                ]
                            ),

                            child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[400]))

                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Username",
                                          hintStyle: TextStyle(color: Colors.black)
                                      ),
                                        validator: (_val) {
                                          if (_val.isEmpty) {
                                            return "Can't be empty";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            email = value;
                                          });
                                        }
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: TextFormField(
                                        key: ValueKey('password'),
                                        obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Set Password",
                                          hintStyle: TextStyle(color: Colors.black)
                                      ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "This Field Is Required."),
                                          MinLengthValidator(6,
                                              errorText: "Minimum 6 Characters Required.")
                                        ]),
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        }
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: TextFormField(
                                        obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Confirm Password",
                                          hintStyle: TextStyle(color: Colors.black)
                                      ),
                                        validator: (_val) {
                                          if (password != confirmpassword) {
                                            return "Password Did Not Match";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            confirmpassword = value;
                                          });
                                        }
                                    ),
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: 70,),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(0,170,140,2),
                                    Color.fromRGBO(0, 170, 140, 2)
                                  ]
                              )
                          ),
                          child: FlatButton(
                              onPressed: (){
                                handleSignup();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text('Signup'),
                              color: Color.fromRGBO(0, 170, 140, 2)
                          ),
                        ),

                      ],
                    )

                )
              ]
          ),
        )
    );
  }
}


