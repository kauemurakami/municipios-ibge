import 'dart:ui';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animacaoBlur;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animacaoBlur = Tween<double>(
      begin: 5,
      end: 0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: _animacaoBlur,
                builder: (context, widget){
                  return Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img_splash.png"),
                              fit: BoxFit.fill
                          )
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: _animacaoBlur.value,
                          sigmaX: _animacaoBlur.value,
                        ),
                      )
                  );
                }
              ),
            ]),
          );
              
  }
}
