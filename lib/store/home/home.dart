import 'package:mobx/mobx.dart';

part 'home.g.dart';

class Home = _Home with _$Home;

abstract class _Home with Store{
  @observable
  int _currentStep = 0;
  
  @action
  void incrementStep(){
    if(this._currentStep < 3 && this._currentStep >= 0){
      this._currentStep++;
      print(this._currentStep);
    }else{
      //caso ja tenha passado todas as etapas
    }
  }
  @action
  void decrementStep(){
    if (this._currentStep > 0) {
      _currentStep--;     
      print(this._currentStep); 
    }
  }

  @computed
  int get getCurrentStep {return this._currentStep;}
  
}