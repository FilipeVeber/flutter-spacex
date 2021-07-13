import 'package:flutter_spacex/app/modules/rockets/repositories/rockets_repository_interface.dart';
import 'package:flutter_spacex/app/modules/rockets/states/search_rockets_state.dart';
import 'package:mobx/mobx.dart';

part 'rocket_store.g.dart';

class RocketStore = _RocketStoreBase with _$RocketStore;

abstract class _RocketStoreBase with Store {
  final IRocketsRepository _repository;

  _RocketStoreBase(this._repository);

  @observable
  SearchRocketsState searchRocketState = SearchRocketsStartState();

  @action
  updateRocketState(SearchRocketsState state) => searchRocketState = state;

  void getRockets() async {
    updateRocketState(SearchRocketsLoadingState());
    final result = await _repository.getRockets();
    result.fold((l) => updateRocketState(SearchRocketsErrorState(l)),
        (r) => updateRocketState(r));
  }
}
