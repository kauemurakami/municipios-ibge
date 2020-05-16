import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:brasiltransparenteapp/data/services/ibg_api_service.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';
import 'dart:core';
part 'home.g.dart';

class Home = _Home with _$Home;

abstract class _Home with Store{

  @observable
  int _currentStep = 0;

  @observable
  Future<List<Estado>> _estados = IBGEApi().getEstados();

  @observable
  Estado _selectedEstado;
  
  @action
  void incrementStep(){
    if(this._currentStep < 2){
      this._currentStep++;
    }else{
      //depois de finalizar
    }
  }
  @action
  void decrementStep(){
    if (this._currentStep > 0) {
      _currentStep--;     
    }else if(this._currentStep <= 0){
      //primeiro step      
    }
  }

  @action
  onChangeDropdownItem(Estado estado){
    if(estado != this._selectedEstado || this._selectedEstado == null){
      this._selectedEstado = estado;
    }
  }

  @computed
  Estado get getSelectedEstado => this._selectedEstado ;

  @computed
  int get getCurrentStep {return this._currentStep; }

  @computed
  get getEstados { return this._estados; }
}