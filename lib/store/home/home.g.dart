// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Home on _Home, Store {
  Computed<Estado> _$getSelectedEstadoComputed;

  @override
  Estado get getSelectedEstado => (_$getSelectedEstadoComputed ??=
          Computed<Estado>(() => super.getSelectedEstado,
              name: '_Home.getSelectedEstado'))
      .value;
  Computed<Cidade> _$getSelectedCidadeComputed;

  @override
  Cidade get getSelectedCidade => (_$getSelectedCidadeComputed ??=
          Computed<Cidade>(() => super.getSelectedCidade,
              name: '_Home.getSelectedCidade'))
      .value;
  Computed<int> _$getCurrentStepComputed;

  @override
  int get getCurrentStep =>
      (_$getCurrentStepComputed ??= Computed<int>(() => super.getCurrentStep,
              name: '_Home.getCurrentStep'))
          .value;
  Computed<dynamic> _$getEstadosComputed;

  @override
  dynamic get getEstados => (_$getEstadosComputed ??=
          Computed<dynamic>(() => super.getEstados, name: '_Home.getEstados'))
      .value;
  Computed<dynamic> _$getCidadesComputed;

  @override
  dynamic get getCidades => (_$getCidadesComputed ??=
          Computed<dynamic>(() => super.getCidades, name: '_Home.getCidades'))
      .value;

  final _$_currentStepAtom = Atom(name: '_Home._currentStep');

  @override
  int get _currentStep {
    _$_currentStepAtom.reportRead();
    return super._currentStep;
  }

  @override
  set _currentStep(int value) {
    _$_currentStepAtom.reportWrite(value, super._currentStep, () {
      super._currentStep = value;
    });
  }

  final _$selectedEstadoAtom = Atom(name: '_Home.selectedEstado');

  @override
  Estado get selectedEstado {
    _$selectedEstadoAtom.reportRead();
    return super.selectedEstado;
  }

  @override
  set selectedEstado(Estado value) {
    _$selectedEstadoAtom.reportWrite(value, super.selectedEstado, () {
      super.selectedEstado = value;
    });
  }

  final _$selectedCidadeAtom = Atom(name: '_Home.selectedCidade');

  @override
  Cidade get selectedCidade {
    _$selectedCidadeAtom.reportRead();
    return super.selectedCidade;
  }

  @override
  set selectedCidade(Cidade value) {
    _$selectedCidadeAtom.reportWrite(value, super.selectedCidade, () {
      super.selectedCidade = value;
    });
  }

  final _$_estadosAtom = Atom(name: '_Home._estados');

  @override
  Future<List<Estado>> get _estados {
    _$_estadosAtom.reportRead();
    return super._estados;
  }

  @override
  set _estados(Future<List<Estado>> value) {
    _$_estadosAtom.reportWrite(value, super._estados, () {
      super._estados = value;
    });
  }

  final _$_cidadesAtom = Atom(name: '_Home._cidades');

  @override
  Future<List<Cidade>> get _cidades {
    _$_cidadesAtom.reportRead();
    return super._cidades;
  }

  @override
  set _cidades(Future<List<Cidade>> value) {
    _$_cidadesAtom.reportWrite(value, super._cidades, () {
      super._cidades = value;
    });
  }

  final _$_HomeActionController = ActionController(name: '_Home');

  @override
  Future<List<Cidade>> gCidades() {
    final _$actionInfo =
        _$_HomeActionController.startAction(name: '_Home.gCidades');
    try {
      return super.gCidades();
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementStep() {
    final _$actionInfo =
        _$_HomeActionController.startAction(name: '_Home.incrementStep');
    try {
      return super.incrementStep();
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementStep() {
    final _$actionInfo =
        _$_HomeActionController.startAction(name: '_Home.decrementStep');
    try {
      return super.decrementStep();
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeDropdownItemE(Estado estado) {
    final _$actionInfo = _$_HomeActionController.startAction(
        name: '_Home.onChangeDropdownItemE');
    try {
      return super.onChangeDropdownItemE(estado);
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeDropdownItemC(Cidade cidade) {
    final _$actionInfo = _$_HomeActionController.startAction(
        name: '_Home.onChangeDropdownItemC');
    try {
      return super.onChangeDropdownItemC(cidade);
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedEstado: ${selectedEstado},
selectedCidade: ${selectedCidade},
getSelectedEstado: ${getSelectedEstado},
getSelectedCidade: ${getSelectedCidade},
getCurrentStep: ${getCurrentStep},
getEstados: ${getEstados},
getCidades: ${getCidades}
    ''';
  }
}
