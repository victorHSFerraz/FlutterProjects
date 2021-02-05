// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $FinanceController = BindInject(
  (i) => FinanceController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FinanceController on _FinanceControllerBase, Store {
  final _$valueAtom = Atom(name: '_FinanceControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_FinanceControllerBaseActionController =
      ActionController(name: '_FinanceControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_FinanceControllerBaseActionController.startAction(
        name: '_FinanceControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_FinanceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
