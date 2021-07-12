import 'package:dartz/dartz.dart';
import 'package:flutter_spacex/app/modules/rockets/errors/rocket_errors.dart';
import 'package:flutter_spacex/app/modules/rockets/states/rocket_state.dart';

abstract class IRocketRepository {
  Future<Either<SearchRocketError, SearchRocketState>> getRockets();
}
