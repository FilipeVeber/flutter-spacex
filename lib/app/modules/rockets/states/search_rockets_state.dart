import 'package:flutter_spacex/app/modules/rockets/entities/rocket.dart';
import 'package:flutter_spacex/app/modules/rockets/errors/rocket_errors.dart';

abstract class SearchRocketsState {}

class SearchRocketsStartState implements SearchRocketsState {
  const SearchRocketsStartState();
}

class SearchRocketsLoadingState implements SearchRocketsState {
  const SearchRocketsLoadingState();
}

class SearchRocketsErrorState implements SearchRocketsState {
  final SearchRocketError error;

  const SearchRocketsErrorState(this.error);
}

class SearchRocketsSuccessState implements SearchRocketsState {
  final List<Rocket> rockets;

  const SearchRocketsSuccessState(this.rockets);
}
