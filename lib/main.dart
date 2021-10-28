import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans"
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: LoginPage(),
      ),
    );

  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  int _pageState = 0;

  var _backgoundColor =  Color(0x6D95);
  var _headingColor = Color(0xF8FAFC);

  double _headingTop = 100;

  double _loginwidth = 0;
  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYofset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  double _loginOpacity = 1;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch(_pageState){
      case 0:
        _headingColor = Color(0xFF006D95);
        _backgoundColor = Color(0xFFFFFFFF);

        _loginXOffset = 0;
        _loginwidth= windowWidth;
        _loginYOffset = windowHeight;
        _registerYofset = windowHeight;
        _headingTop = 100;
        break;
      case 1:
        _backgoundColor =Color(0xFF006D95);
        _headingColor = Color(0xFFFAFAFA);
        _loginYOffset = 270;
        _loginXOffset = 0;
        _registerYofset = windowHeight;
        _loginwidth= windowWidth;
        _loginOpacity=1;
        _headingTop = 90;
        break;
      case 2:
        _backgoundColor = Color(0xFF006D95);
        _headingColor = Color(0xFFC9C458);
        _loginYOffset = 240;
        _loginXOffset = 20;
        _registerYofset = 270;
        _loginOpacity = 0.7;
        _loginwidth= windowWidth - 40;
        _headingTop = 80;
        break;

    }
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000
          ),
          color: _backgoundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(
                          milliseconds: 1000
                        ),
                        margin: EdgeInsets.only(
                          top: _headingTop,
                        ),
                        child: Text(
                          "Book You Appointment",
                          style: TextStyle(
                              color: _headingColor,
                              fontSize: 25
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          "Book an appointment for Hospital, Labs ,and Online Consulting",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          color: _headingColor,
                          fontSize: 13
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(

                  child: Image.asset("assets/images/favicon.ico"),

                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_pageState != 0){
                        _pageState = 0;
                      }else{
                        _pageState = 1;
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(35),
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      //color: Color(0xFFB40284A),
                      color: Color(0xff065d95),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Center(
                        child: Text(
                          "Get started",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 20
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              _pageState = 2;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginwidth,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000
            ),
            transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Login To Continue",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                    Inputwidgeticon(),
                    SizedBox(
                      height: 20,
                    ),
                    Inputwidgeticon()
                  ],
                ),
                Column(
                  children: <Widget>[
                    PrimaryButton(
                      btnText: "Login",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Outlinebtn(btnText: "Create Account")
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              _pageState = 1;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(20),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(
                milliseconds: 1000
            ),
            transform: Matrix4.translationValues(0, _registerYofset, 1),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                )
            ),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Create a New Account",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    PrimaryButton(
                      btnText: "Create Account",
                    ), SizedBox(
                      height: 20,
                    ),
                    Outlinebtn(btnText: "Back To Login")
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Inputwidgeticon extends StatefulWidget {
  const Inputwidgeticon({Key? key}) : super(key: key);

  @override
  _InputwidgeticonState createState() => _InputwidgeticonState();
}

class _InputwidgeticonState extends State<Inputwidgeticon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFF007A9C),
              width: 2
          ),

          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            child: Icon(Icons.phone,
            size: 20,
            color: Color(0xFFBB9B989),)
          ),
          Expanded(child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              border:InputBorder.none,
              hintText: "Enter Phone or Email"
            ),
          ))
        ],
      ),
    );
  }
}


class PrimaryButton extends StatefulWidget {
  final String btnText;

  const PrimaryButton({Key? key, required this.btnText}) : super(key: key);



  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

        color: Color(0xFF007A9C),
        borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
        widget.btnText,
        style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 17
        ),
        ),
      ),
    );
  }
}

class Outlinebtn extends StatefulWidget {
  final String btnText;

  const Outlinebtn({Key? key, required this.btnText}) : super(key: key);

  @override
  _OutlinebtnState createState() => _OutlinebtnState();
}

class _OutlinebtnState extends State<Outlinebtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFF007A9C),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Color(0xFF007A9C),
              fontSize: 17
          ),
        ),
      ),
    );
  }
}
