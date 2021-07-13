import 'package:dartz/dartz.dart';
import 'package:flutter_spacex/app/modules/rockets/errors/rocket_errors.dart';
import 'package:flutter_spacex/app/modules/rockets/states/search_rocket_state.dart';
import 'package:flutter_spacex/app/modules/rockets/states/search_rockets_state.dart';

abstract class IRocketsRepository {
  Future<Either<SearchRocketError, SearchRocketsState>> getRockets();

  Future<Either<SearchRocketError, SearchRocketState>> getRocketById(String id);
}
