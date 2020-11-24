import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmatiq/screens/homedesign.dart';
import 'package:pharmatiq/screens/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green,),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum InputType {
  phone,
  sms
}

class PhonePage extends StatefulWidget {
  @override _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final _phoneTextController = TextEditingController();
  final _smsCodeTextController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text('Sign up with Phone'),
        leading:GestureDetector(
          onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage2()));},
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor:Color.fromRGBO(0, 170, 140, 6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60,),
            _signUpTextFormField(InputType.phone),
            AnimatedContainer(
                height: _verificationId == null ? 0 : 80,
                duration: const Duration(milliseconds: 400),

                child: _verificationId != null ? _signUpTextFormField(InputType.sms) : Container()
            ),
            SizedBox(height: 40,),
            _signUpButton(InputType.phone),

            AnimatedContainer(
                height: _verificationId == null ? 0 : 74,
                duration: const Duration(milliseconds: 400),
                child: _signUpButton(InputType.sms)
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpTextFormField(InputType type) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: type == InputType.phone ? TextInputType.phone : TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(type == InputType.phone ? Icons.phone : Icons.sms),
            labelText: type == InputType.phone ? 'Phone' : 'SMS Code',
            hintText: type == InputType.phone ? 'Phone number with +(Country number)' : 'Type SMS Code'
        ),
        validator: (String value) => value.trim().isEmpty ? type == InputType.phone ? 'Phone is required' : 'SMS Code is required' : null,
        controller: type == InputType.phone ? _phoneTextController : _smsCodeTextController,
      ),
    );
  }

  Widget _signUpButton(InputType type){
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(16),
        textColor: type == InputType.phone ? Colors.white : Colors.white,
        color: type == InputType.phone ?  Color.fromRGBO(0, 170, 140, 2): Color.fromRGBO(0, 170, 140, 2) ,
        //Colors.green[400].withOpacity(0.62)
            //: Colors.white,
        onPressed: () => type == InputType.phone ? _requestSMSCodeUsingPhoneNumber() : _signInWithPhoneNumberAndSMSCode(),
        child: Text(type == InputType.phone ? 'Request OTP' : 'Sign in with OTP', style: TextStyle(fontSize: 18),),
      ),
    );
  }

  void _requestSMSCodeUsingPhoneNumber() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneTextController.text,
        timeout: Duration(seconds:60),
        verificationCompleted: (AuthCredential phoneAuthCredential) => print('Sign up with phone complete'),
        verificationFailed: (AuthException error) => print('error message is ${error.message}'),
        codeSent:(String verificationId, [int forceResendingToken]) {
          print('verificationId is $verificationId');
          setState(() => _verificationId = verificationId);
        },
        codeAutoRetrievalTimeout: null);
  }

  void _signInWithPhoneNumberAndSMSCode() async{
    AuthCredential authCreds = PhoneAuthProvider.getCredential(verificationId: _verificationId, smsCode: _smsCodeTextController.text);
    final FirebaseUser user = (await FirebaseAuth.instance.signInWithCredential(authCreds)).user;
    print("User Phone number is" + user.phoneNumber);

    _smsCodeTextController.text = '';
    _phoneTextController.text = '';
    setState(() => _verificationId = null);
    FocusScope.of(context).requestFocus(FocusNode());
    _showSnackBar('Sign up with phone success. Check your firebase.');
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => DashboardPage()));
  }

  void _showSnackBar(msg){
    final snackBar = SnackBar(content: Text(msg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}