import 'package:brasiltransparenteapp/screens/android/style/text_style.dart';
import 'package:brasiltransparenteapp/store/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../style/text_style.dart';
import '../../style/text_style.dart';
import 'home_dropdown_estados_widget.dart';
import 'home_text_field_widget.dart';

class StepperWidget extends StatelessWidget {
  List<Step> _mySteps(_homeStore) {
    List<Step> _steps = [
      Step(
        title: Text(
          "Estado",
          style: styleTextStepper,
        ),
        content: DropDownWidget(_homeStore),
        isActive: _homeStore.getCurrentStep >= 0,
      ),
      Step(
        title: Text(
          "Cidade",
          style: styleTextStepper,
        ),
        content: TextFieldCidades(),
        isActive: _homeStore.getCurrentStep >= 1,
      ),
      Step(
          title: Text(
            "Confirmar",
            style: styleTextStepper,
          ),
          content: Observer(builder: (_) {
            return Row(
              children: <Widget>[
                Text(_homeStore.selectedCidade.nome+' - '+_homeStore.selectedEstado.sigla, style: styleTextDropDown,),
              ],
            );
          }),
          isActive: _homeStore.getCurrentStep >= 2,
          state: StepState.complete)
    ];
    return _steps;
  }

  @override
  Widget build(BuildContext context) {
    final Home _homeStore = Provider.of<Home>(context);

    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height,
        child: Stepper(
          onStepContinue: _homeStore.incrementStep,
          onStepCancel: _homeStore.decrementStep,
          steps: _mySteps(_homeStore),
          currentStep: _homeStore.getCurrentStep,
        ),
      );
    });
  }
}
