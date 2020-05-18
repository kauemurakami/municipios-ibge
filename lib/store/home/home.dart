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
  Estado selectedEstado;

  @observable
  Cidade selectedCidade;

  @observable
  Future<List<Estado>> _estados = IBGEApi().getEstados();

  @observable
  Future<List<Cidade>> _cidades;

  @action
  Future<List<Cidade>> gCidades(){
    if(getSelectedEstado.sigla.isNotEmpty){
      print(getSelectedEstado.sigla);
      _cidades = IBGEApi().getCidades(getSelectedEstado.sigla);
      return _cidades;
    }else { print('sem sigla');}
    return _cidades;
  }

  @action
  void incrementStep() {
    if (this._currentStep < 2) {
      this._currentStep++;
      if(this._currentStep == 1){
        gCidades();
      }
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
  onChangeDropdownItemE(Estado estado) {
    this.selectedEstado = estado;
  }

  @action
  onChangeDropdownItemC(Cidade cidade) {
    this.selectedCidade = cidade;
  }

  @computed
  Estado get getSelectedEstado {
    return this.selectedEstado;
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
  get getCidades {
    return this._cidades;
  }
}
