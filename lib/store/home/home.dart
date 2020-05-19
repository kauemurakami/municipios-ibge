import 'package:brasiltransparenteapp/data/models/cidade_model.dart';
import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:brasiltransparenteapp/data/services/ibg_api_service.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';
import 'dart:core';
part 'home.g.dart';

class Home = _Home with _$Home;

abstract class _Home with Store {
  @observable
  int _currentStep = 0;

  @observable
  Estado _selectedEstado;

  @observable
  Cidade selectedCidade;

  @observable
  Future<List<Estado>> _estados = IBGEApi().getEstados();

  @observable
  Future<List<Cidade>> _cidades;

  @action
  void incrementStep() {
    if (this._currentStep < 2) {
      this._currentStep++;
    } else {
      //depois de finalizar
    }
  }

  @action
  void decrementStep() {
    if (this._currentStep > 0) {
      _currentStep--;
    } else if (this._currentStep <= 0) {
      //primeiro step
    }
  }

  @action
  onChangeDropdownItem(Estado estado) {
    selectedEstado = estado;
  }

  set selectedEstado (Estado e) => this._selectedEstado = e;

  
  Estado get selectedEstado {
    return this._selectedEstado;
  }

  @computed
  Cidade get getSelectedCidade {
    return this.selectedCidade;
  }

  @computed
  int get getCurrentStep {
    return this._currentStep;
  }

  @computed
  get getEstados {
    return this._estados;
  }
  @computed
  get cidades{
    return _cidades;
  }
  
  @action
  Future<List<Cidade>> recuperaCidades(Estado e){
    _cidades = IBGEApi().getCidades(e);
    return cidades;
  }
}
