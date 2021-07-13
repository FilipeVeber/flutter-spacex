// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RocketDetailsStore on _RocketDetailsStoreBase, Store {
  final _$stateAtom = Atom(name: '_RocketDetailsStoreBase.state');

  @override
  SearchRocketState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SearchRocketState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_RocketDetailsStoreBaseActionController =
      ActionController(name: '_RocketDetailsStoreBase');

  @override
  dynamic updateSearchRocketState(SearchRocketState value) {
    final _$actionInfo = _$_RocketDetailsStoreBaseActionController.startAction(
        name: '_RocketDetailsStoreBase.updateSearchRocketState');
    try {
      return super.updateSearchRocketState(value);
    } finally {
      _$_RocketDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
