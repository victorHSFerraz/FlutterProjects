// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $FinanceController = BindInject(
  (i) => FinanceController(repository: i<FinanceRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FinanceController on _FinanceControllerBase, Store {
  final _$loadingAtom = Atom(name: '_FinanceControllerBase.loading');

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

  final _$helperAtom = Atom(name: '_FinanceControllerBase.helper');

  @override
  FinanceHelper get helper {
    _$helperAtom.reportRead();
    return super.helper;
  }

  @override
  set helper(FinanceHelper value) {
    _$helperAtom.reportWrite(value, super.helper, () {
      super.helper = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_FinanceControllerBase.get');

  @override
  Future<void> get() {
    return _$getAsyncAction.run(() => super.get());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
helper: ${helper}
    ''';
  }
}
