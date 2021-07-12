import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spacex/app/modules/rockets/entities/rocket.dart';
import 'package:flutter_spacex/app/modules/rockets/errors/rocket_errors.dart';
import 'package:flutter_spacex/app/modules/rockets/repositories/rocket_repository_interface.dart';
import 'package:flutter_spacex/app/modules/rockets/states/rocket_state.dart';

class RocketRepository implements IRocketRepository {
  final Dio _dio;

  RocketRepository(this._dio);

  @override
  Future<Either<SearchRocketError, SearchRocketState>> getRockets() async {
    try {
      final Response response = await _dio.get("/v4/rockets");

      if (response.statusCode != 200) {
        return left(SearchRocketError(response.statusMessage));
      }

      var rockets =
          List<Rocket>.from(response.data.map((map) => Rocket.fromMap(map)));

      return right(SearchRocketSuccessState(rockets));
    } catch (e) {
      return left(SearchRocketError(e.toString()));
    }
  }
}
