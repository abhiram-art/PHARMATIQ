import 'package:flutter/material.dart';
import 'package:pharmatiq/screens/adminLogin.dart';
import 'package:pharmatiq/screens/login.dart';
import 'package:pharmatiq/screens/adminshiftorders.dart';

class UploadPage extends StatefulWidget{
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> with AutomaticKeepAliveClientMixin<UploadPage>
{
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return displayAdminHomeScreen();
  }
  displayAdminHomeScreen()
  {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            color: Color.fromRGBO(0, 170, 140, 1),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.border_color , color: Colors.white,),
          onPressed: ()
          {
            Route route = MaterialPageRoute(builder: (c) => AdminShiftOrders());
            Navigator.pushReplacement(context, route);
          },
        ),
        actions: [
          FlatButton(
            child: Text("Logout",style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),),
            onPressed: ()
            {
              Route route = MaterialPageRoute(builder: (c) => AdminPage());
              Navigator.pushReplacement(context, route);
            },
          ),
        ],
      ),
      body: getAdminHomeScreenBody(),
    );
  }
  getAdminHomeScreenBody()
  {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_two, color: Colors.green, size: 200.0,),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
                child: Text("Add New Items",style: TextStyle(fontSize: 20.0 ,color: Colors.black),),
                color: Colors.green,
                onPressed: () => print("click"),
              ),
            )
          ],
        ),
      ),
    );
  }
}