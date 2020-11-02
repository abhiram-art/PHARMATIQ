import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmatiq/productlist.dart';

import 'package:flutter/cupertino.dart';

class listproduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("Home"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 10,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 170, 140, 2),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("0")),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,

                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(0, 170, 140, 2),
                            Color.fromRGBO(0, 170, 140, 2),
                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Tablets", style: TextStyle(color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: TextField(  decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '      Search Tablets'
                          ),)
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      children: <Widget> [

                        _buildCard('Calpol', 'Rs 5', 'images/calpol1.png',
                            false, false, context),
                        _buildCard('Paracetamol', 'Rs 5', 'images/paracetmol.jpg',
                            true, false, context),
                        _buildCard('Cinarest', 'Rs 5',
                            'images/cinarest.jpg', false, true, context),
                        _buildCard('Crocin', 'Rs 5', 'images/crocin.jpg',
                            false, false, context)

                      ]

                  )

              )
            ],
          ),
        ),
      ),
    );
  }
}





Widget _buildCard(String name, String price, String imgPath1, bool added,
    bool isFavorite, context) {
  return Padding(
      padding: EdgeInsets.only(top: 7.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => nextpage()));
          },

          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isFavorite
                              ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                              : Icon(Icons.favorite_border,
                              color: Color(0xFFEF7532))
                        ])),
                Hero(
                    tag: imgPath1,
                    child: Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath1),
                                fit: BoxFit.contain)))),
                SizedBox(height: 7.0),
                Text(price,
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                SizedBox(height: 7),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),

              ]))));
}

