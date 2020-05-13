import 'dart:ui';
import 'package:brasiltransparenteapp/screens/android/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

@override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), 
    () =>
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context)=> HomePage()) 
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
            children: <Widget>[
              Padding(
                    padding: EdgeInsets.only(top: 200, bottom: 10),
                    child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/img_splash.png"),
                                fit: BoxFit.fill
                            )
                        ),
                    ),
                  ),
                  Text("Brasil Transparente", 
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 20,
                    decoration: TextDecoration.none
                  ),),
            ]),
          );
  }
}
