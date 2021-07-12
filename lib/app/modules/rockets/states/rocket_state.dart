import 'package:flutter_spacex/app/modules/rockets/entities/rocket.dart';
import 'package:flutter_spacex/app/modules/rockets/errors/rocket_errors.dart';

abstract class SearchRocketState {}

class SearchRocketStartState implements SearchRocketState {
  const SearchRocketStartState();
}

class SearchRocketLoadingState implements SearchRocketState {
  const SearchRocketLoadingState();
}

class SearchRocketErrorState implements SearchRocketState {
  final SearchRocketError error;

  const SearchRocketErrorState(this.error);
}

class SearchRocketSuccessState implements SearchRocketState {
  final List<Rocket> rockets;

  const SearchRocketSuccessState(this.rockets);
}
