import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EcommerceApp
{
    static const String appName = 'pharmatiq';

    static SharedPreferences sharedPreferences;
    static FirebaseUser User;
    static FirebaseAuth auth;
    static Firestore firestore;

    static String collectionUser = "User";
    static String collectionOrder ="orders";
    static String userCartList = "userCart";
    static String subCollectionAddress = "useraddress";

    //static final String userName = 'name';
    static final String userEmail = 'email';
    static final String useruid = 'uid';

    static final String addressid = 'addressid';
    static final String totalAmount = 'totalAmount';
    static final String productId = 'productId';
    static final String paymentDetails = 'payementDetails';
    static final String orderTime = 'orderTime';
    static final String isSuccess = 'isSuccess';

}