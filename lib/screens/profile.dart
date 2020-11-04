import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmatiq/widgets/my_button.dart';
import '../widgets/notification_button.dart';
class profile extends StatefulWidget{
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  Widget _buildSingleContainer({String startText,String endText}){
    return Card(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30)
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(startText,style: TextStyle(fontSize: 17,color: Colors.black),),
            Text(endText,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTextForm({String name}){
    return  TextFormField(
      decoration: InputDecoration(
          hintText: name,
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );
  }

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:edit== true? IconButton(icon: Icon(Icons.close,color: Colors.redAccent,size: 30,), onPressed: (){
          setState(() {
            edit = false;
          });
        },):Container(),
        backgroundColor:  Color.fromRGBO(0, 170, 140, 6),
        actions: [
          edit == false ? NotificationButton():
          IconButton(icon: Icon(Icons.check,size: 30,color: Colors.white,), onPressed: (){
          }
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 130,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      //color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            maxRadius: 65,
                            backgroundImage: AssetImage("images/profile.png"),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    edit==true ? Padding(
                      padding: const EdgeInsets.only(left: 225,top: 80),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.edit,color:Colors.black,),
                        ),
                      ),
                    ):Container(

                    ),
                  ],
                ),
                Container(
                  height:300,
                  width:double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height:300,
                          child: edit==true ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildSingleTextForm(name: " ABC"),
                              _buildSingleTextForm(name:" Abc"),
                              _buildSingleTextForm(name: "Abcdef"),
                              _buildSingleTextForm(name: "A123"),

                            ],
                          )
                              : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildSingleContainer(
                                startText: "Name",
                                endText: "ABC",
                              ),
                              _buildSingleContainer(
                                startText: "email",
                                endText: "ABC@gmail.com",
                              ),
                              _buildSingleContainer(
                                startText: "Address",
                                endText: "ABCdef",
                              ),
                              _buildSingleContainer(
                                startText: "PhoneNo",
                                endText: "1234",
                              )
                            ],
                          )
                      ),
                      // _buildSingleContainer(
                      // startText: "Name",
                      //endText: "ABC",
                      //),
                      //_buildSingleContainer(
                      //startText: "email",
                      //endText: "ABC@gmail.com",
                      //),
                      //_buildSingleContainer(
                      //startText: "Address",
                      //endText: "ABCdef",
                      //),
                      //_buildSingleContainer(
                      //startText: "PhoneNo",
                      //endText: "1234",
                      //)
                    ],
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        //color: Color.fromRGBO(0, 170, 140, 6)
                      ),
                      width: 200,
                      child:edit== false ? MyButton(
                        name:"Edit Profile",
                        onPressed: (){
                          setState(() {
                            edit = true;
                          });
                        },
                      ):Container(),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}