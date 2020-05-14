import 'package:brasiltransparenteapp/screens/android/home/components/home_dropdown_cidades_widget.dart';
import 'package:brasiltransparenteapp/screens/android/style/text_style.dart';
import 'package:flutter/material.dart';

import 'home_dropdown_estados_widget.dart';
class StepperWidget extends StatefulWidget {
  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text("Escolha seu estado", style: styleTextStepper,),
        content: DropDownWidget(),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text("Escolha sua cidade", style: styleTextStepper,),
        content: DropDownCityWidget(),
        isActive: _currentStep >= 1,
      )
    ];
    return _steps;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height,
        child: Stepper(       
          onStepContinue: (){
            setState(() {
              if(this._currentStep < this._mySteps().length -1){
                this._currentStep = this._currentStep +1;
              }else {
                //logico de checar se está tudo completo
              }
            });
          },
          onStepCancel: (){
            setState(() {
              if(this._currentStep > 0){
                this._currentStep = this._currentStep - 1;
              }else{
                this._currentStep = 0;
              }
            });
          },
          steps: _mySteps(),
          currentStep: this._currentStep,
        ),
      );
  }
}