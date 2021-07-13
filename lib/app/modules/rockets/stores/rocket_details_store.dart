import 'package:flutter_spacex/app/modules/rockets/repositories/rockets_repository.dart';
import 'package:flutter_spacex/app/modules/rockets/states/search_rocket_state.dart';
import 'package:mobx/mobx.dart';

part 'rocket_details_store.g.dart';

class RocketDetailsStore = _RocketDetailsStoreBase with _$RocketDetailsStore;

abstract class _RocketDetailsStoreBase with Store {
  final RocketsRepository _repository;

  _RocketDetailsStoreBase(this._repository);

  @observable
  SearchRocketState state = SearchRocketStartState();

  @action
  updateSearchRocketState(SearchRocketState value) => state = value;

  void getRocket(String id) async {
    updateSearchRocketState(SearchRocketLoadingState());
    var result = await _repository.getRocketById(id);
    result.fold((l) => updateSearchRocketState(SearchRocketErrorState(l)),
        (r) => updateSearchRocketState(r));
  }
}
