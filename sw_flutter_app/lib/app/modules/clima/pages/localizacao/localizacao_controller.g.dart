// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizacao_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LocalizacaoController = BindInject(
  (i) => LocalizacaoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocalizacaoController on _LocalizacaoControllerBase, Store {
  final _$loadingAtom = Atom(name: '_LocalizacaoControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getLocationAsyncAction =
      AsyncAction('_LocalizacaoControllerBase.getLocation');

  @override
  Future<void> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
