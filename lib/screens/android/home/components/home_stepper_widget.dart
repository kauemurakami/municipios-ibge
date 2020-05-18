import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:brasiltransparenteapp/screens/android/home/components/home_textf_cidade_widget.dart';
import 'package:brasiltransparenteapp/screens/android/style/text_style.dart';
import 'package:brasiltransparenteapp/store/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'home_dropdown_estados_widget.dart';

class StepperWidget extends StatelessWidget {
  final Home _homeStore = Home();
  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text(
          "Escolha seu estado",
          style: styleTextStepper,
        ),
        content: DropDownWidget(),
        isActive: _homeStore.getCurrentStep >= 0,
      ),
      Step(
        title: Text(
          "Escolha sua cidade",
          style: styleTextStepper,
        ),
        content: TextFieldCidades(estado: _homeStore.getSelectedEstado),
        isActive: _homeStore.getCurrentStep >= 1,
      ),
      Step(
          title: Text(
            "Confirmar",
            style: styleTextStepper,
          ),
          content: Text("uf - cidade"),
          isActive: _homeStore.getCurrentStep >= 2,
          state: StepState.complete)
    ];
    return _steps;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
      return Container(
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height,
        child: Stepper(
          onStepContinue: _homeStore.incrementStep,
          onStepCancel: _homeStore.decrementStep,
          steps: _mySteps(),
          currentStep: _homeStore.getCurrentStep,
        ),
      );
    });
  }
}
