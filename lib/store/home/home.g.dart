// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Home on _Home, Store {
  Computed<int> _$getCurrentStepComputed;

  @override
  int get getCurrentStep =>
      (_$getCurrentStepComputed ??= Computed<int>(() => super.getCurrentStep,
              name: '_Home.getCurrentStep'))
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

  final _$_HomeActionController = ActionController(name: '_Home');

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
  String toString() {
    return '''
getCurrentStep: ${getCurrentStep}
    ''';
  }
}
