// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clima_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ClimaController = BindInject(
  (i) => ClimaController(repository: i<WeatherRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClimaController on _ClimaControllerBase, Store {
  final _$loadingAtom = Atom(name: '_ClimaControllerBase.loading');

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

  final _$titleAtom = Atom(name: '_ClimaControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$listAtom = Atom(name: '_ClimaControllerBase.list');

  @override
  List<Forecast> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<Forecast> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_ClimaControllerBase.get');

  @override
  Future<void> get(Position position) {
    return _$getAsyncAction.run(() => super.get(position));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
title: ${title},
list: ${list}
    ''';
  }
}
