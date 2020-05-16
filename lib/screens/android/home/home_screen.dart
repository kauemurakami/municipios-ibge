import 'package:brasiltransparenteapp/screens/android/components/bottom_navigation_bar.dart';
import 'package:brasiltransparenteapp/screens/android/components/floatting_button_search.dart';
import 'package:brasiltransparenteapp/screens/android/home/components/home_stepper_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:StepperWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatButtonWidget(),
      bottomNavigationBar: BottomMenuWidget()
    );
  }
}
