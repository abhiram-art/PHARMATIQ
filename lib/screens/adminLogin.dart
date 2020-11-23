import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmatiq/screens/login.dart';
import 'package:pharmatiq/screens/uploaditems.dart';
import 'package:pharmatiq/widgets/custometextfield.dart';

import 'option.dart';


Future<void> main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}


class AdminPage extends StatefulWidget{
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final GlobalKey<FormState> _formkey = GlobalKey <FormState>();
  final TextEditingController _adminIdTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  void loginAdmin()
  {
    Firestore.instance.collection("admins").getDocuments().then((snapshot){
      snapshot.documents.forEach((result) {
        if(result.data["id"] == _adminIdTextEditingController.text.trim() && result.data["password"] == _passwordTextEditingController.text.trim())
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => option()));
        }
      });
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
                  height: 153,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/green3.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 82),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 59),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 170, 140, 1),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10)
                                  )
                                ]
                            ),

                            child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(1.0),
                                  ),
                                  Form(

                                    key: _formkey,
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          controller: _adminIdTextEditingController,
                                          data: Icons.email,
                                          hintText: "Admin Id",
                                          isObsecure: false,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(13.0),
                                        ),
                                        CustomTextField(
                                          controller: _passwordTextEditingController,
                                          data: Icons.lock,
                                          hintText: "password",
                                          isObsecure: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                            )
                        ),
                        SizedBox(height: 65,),
                        Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(0, 170, 140, 2),
                                      Color.fromRGBO(0, 170, 140, 2)
                                    ]
                                )
                            ),
                            child: FlatButton(
                                onPressed: () {
                                  loginAdmin();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Text('Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold
                                   ),
                                ),
                                color: Color.fromRGBO(0, 170, 140, 2)
                            )
                        ),
                        SizedBox(height: 36,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => HomePage2()));
                          },
                          child: Text('Not an Admin?',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 170, 140, 1),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                            ),
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



