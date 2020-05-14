import 'package:brasiltransparenteapp/screens/android/home/home_screen.dart';
import 'package:flutter/material.dart';

class FloatButtonWidget extends StatelessWidget {
  const FloatButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
          child: Icon(
            Icons.search,
            color: Colors.white,
          ));
  }
}