import 'package:flutter_spacex/app/modules/rockets/repositories/rocket_repository_interface.dart';
import 'package:flutter_spacex/app/modules/rockets/states/rocket_state.dart';
import 'package:mobx/mobx.dart';

part 'rocket_store.g.dart';

class RocketStore = _RocketStoreBase with _$RocketStore;

abstract class _RocketStoreBase with Store {
  final IRocketRepository _repository;

  _RocketStoreBase(this._repository);

  @observable
  SearchRocketState searchRocketState = SearchRocketStartState();

  @action
  updateRocketState(SearchRocketState state) => searchRocketState = state;

  void getRockets() async {
    updateRocketState(SearchRocketLoadingState());
    final result = await _repository.getRockets();
    result.fold((l) => updateRocketState(SearchRocketErrorState(l)),
        (r) => updateRocketState(r));
  }
}
