import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmatiq/screens/adminLogin.dart';
import 'package:pharmatiq/screens/adminshiftorders.dart';
import 'package:pharmatiq/widgets/loadingwidget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pharmatiq/item.dart';

class UploadPage extends StatefulWidget{
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> with AutomaticKeepAliveClientMixin<UploadPage>
{
  bool get wantKeepAlive => true;
  File file;
  TextEditingController _descripitionTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _shortInfoTextEditingController = TextEditingController();
  String productId = DateTime.now().millisecondsSinceEpoch.toString();
  bool uploading = false;


  @override
  Widget build(BuildContext context) {
    return file == null ? displayAdminHomeScreen() : displayAdminUploadFormcreen();
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
                onPressed: () => takeImage(context),
              ),
            )
          ],
        ),
      ),
    );
  }
  takeImage(mContext)
  {
    return showDialog(
        context: mContext,
        builder: (con)
        {
          return SimpleDialog(
            title: Text("Item Image" , style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            children: [
              SimpleDialogOption(
                child : Text("Capture With Camera",style: TextStyle(color: Colors.green ,),),
                onPressed: capturePhotoWithCamera,
              ),
              SimpleDialogOption(
                child : Text("Select From Gallery",style: TextStyle(color: Colors.green ,),),
                onPressed: pickPhotoFromGallery,
              ),
              SimpleDialogOption(
                child : Text("Cancel",style: TextStyle(color: Colors.green ,),),
                onPressed: ()
                {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

  capturePhotoWithCamera() async
  {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 680.0, maxWidth: 970.0);
    setState(() {
      file = imageFile;
    });
  }

  pickPhotoFromGallery() async
  {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery,);
    setState(() {
      file = imageFile;
    });
  }

  displayAdminUploadFormcreen()
  {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            color: Color.fromRGBO(0, 170, 140, 1),
          ),
        ),
       leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: clearFormInfo),
        title: Text("New Product", style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),
        actions: [
          FlatButton(
            onPressed: uploading ? null : () =>  uploadImageAndSaveItemInfo(),
            child: Text("Add" ,style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
      body: ListView(
        children: [
          uploading ? circularProgress() : Text(""),
          Container(
            height: 230.0,
            width: MediaQuery.of(context).size.width*0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(image: DecorationImage(image: FileImage(file), fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 12.0),),
          ListTile(
            leading: Icon(Icons.perm_device_information , color: Colors.green,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: _shortInfoTextEditingController,
                decoration: InputDecoration(
                  hintText: "Short Info",
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          Divider(color: Colors.green,),
          ListTile(
            leading: Icon(Icons.perm_device_information , color: Colors.green,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: _titleTextEditingController,
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          Divider(color: Colors.green,),
          ListTile(
            leading: Icon(Icons.perm_device_information , color: Colors.green,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: _descripitionTextEditingController,
                decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          Divider(color: Colors.green,),
          ListTile(
            leading: Icon(Icons.perm_device_information , color: Colors.green,),
            title: Container(
              width: 250.0,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                controller: _priceTextEditingController,
                decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          Divider(color: Colors.green,)
        ],
      ),
    );
  }
  clearFormInfo()
  {
    setState(() {
      file = null;
      _descripitionTextEditingController.clear();
      _priceTextEditingController.clear();
      _shortInfoTextEditingController.clear();
      _titleTextEditingController.clear();
    });
  }
  uploadImageAndSaveItemInfo() async
  {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file);
    saveItemInfo(imageDownloadUrl);
  }
  Future<String> uploadItemImage(mFileImage) async
  {
    final StorageReference storageReference = FirebaseStorage.instance.ref().child("Items");
    StorageUploadTask uploadTask = storageReference.child("product_$productId.jpg").putFile(mFileImage);
    StorageTaskSnapshot takeSnapshot = await uploadTask.onComplete;
    String downloadUrl = await takeSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
  saveItemInfo(String downloadUrl)
  {
    final itemsRef = Firestore.instance.collection("Items");
    itemsRef.document(productId).setData({
      "shortInfo" : _shortInfoTextEditingController.text.trim(),
      "longDescription" : _descripitionTextEditingController.text.trim(),
      "price" : int.parse(_priceTextEditingController.text),
      "publishedDare" : DateTime.now(),
      "status" : "available",
      "thumbnailUrl" : downloadUrl,
      "title" : _titleTextEditingController.text.trim(),
    });
    setState(() {
      file = null;
      uploading = false;
      productId = DateTime.now().millisecondsSinceEpoch.toString();
      _descripitionTextEditingController.clear();
      _priceTextEditingController.clear();
      _shortInfoTextEditingController.clear();
      _titleTextEditingController.clear();
    });
  }
}
