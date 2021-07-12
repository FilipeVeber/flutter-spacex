// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RocketStore on _RocketStoreBase, Store {
  final _$searchRocketStateAtom =
      Atom(name: '_RocketStoreBase.searchRocketState');

  @override
  SearchRocketState get searchRocketState {
    _$searchRocketStateAtom.reportRead();
    return super.searchRocketState;
  }

  @override
  set searchRocketState(SearchRocketState value) {
    _$searchRocketStateAtom.reportWrite(value, super.searchRocketState, () {
      super.searchRocketState = value;
    });
  }

  final _$_RocketStoreBaseActionController =
      ActionController(name: '_RocketStoreBase');

  @override
  dynamic updateRocketState(SearchRocketState state) {
    final _$actionInfo = _$_RocketStoreBaseActionController.startAction(
        name: '_RocketStoreBase.updateRocketState');
    try {
      return super.updateRocketState(state);
    } finally {
      _$_RocketStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchRocketState: ${searchRocketState}
    ''';
  }
}
