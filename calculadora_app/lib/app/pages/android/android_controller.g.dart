// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AndroidController = BindInject(
  (i) => AndroidController(i<ApiRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AndroidController on _AndroidControllerBase, Store {
  final _$hasConnectedAtom = Atom(name: '_AndroidControllerBase.hasConnected');

  @override
  bool get hasConnected {
    _$hasConnectedAtom.reportRead();
    return super.hasConnected;
  }

  @override
  set hasConnected(bool value) {
    _$hasConnectedAtom.reportWrite(value, super.hasConnected, () {
      super.hasConnected = value;
    });
  }

  final _$displayAtom = Atom(name: '_AndroidControllerBase.display');

  @override
  String get display {
    _$displayAtom.reportRead();
    return super.display;
  }

  @override
  set display(String value) {
    _$displayAtom.reportWrite(value, super.display, () {
      super.display = value;
    });
  }

  final _$_AndroidControllerBaseActionController =
      ActionController(name: '_AndroidControllerBase');

  @override
  void alterConnect(bool value, GlobalKey<ScaffoldState> key) {
    final _$actionInfo = _$_AndroidControllerBaseActionController.startAction(
        name: '_AndroidControllerBase.alterConnect');
    try {
      return super.alterConnect(value, key);
    } finally {
      _$_AndroidControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calcule({List<String> num, List<String> ope}) {
    final _$actionInfo = _$_AndroidControllerBaseActionController.startAction(
        name: '_AndroidControllerBase.calcule');
    try {
      return super.calcule(num: num, ope: ope);
    } finally {
      _$_AndroidControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculeApi() {
    final _$actionInfo = _$_AndroidControllerBaseActionController.startAction(
        name: '_AndroidControllerBase.calculeApi');
    try {
      return super.calculeApi();
    } finally {
      _$_AndroidControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void displayInput(String valor) {
    final _$actionInfo = _$_AndroidControllerBaseActionController.startAction(
        name: '_AndroidControllerBase.displayInput');
    try {
      return super.displayInput(valor);
    } finally {
      _$_AndroidControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasConnected: ${hasConnected},
display: ${display}
    ''';
  }
}
