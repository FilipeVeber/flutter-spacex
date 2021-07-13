import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spacex/app/modules/rockets/entities/rocket.dart';
import 'package:flutter_spacex/app/modules/rockets/errors/rocket_errors.dart';
import 'package:flutter_spacex/app/modules/rockets/repositories/rockets_repository_interface.dart';
import 'package:flutter_spacex/app/modules/rockets/states/search_rocket_state.dart';
import 'package:flutter_spacex/app/modules/rockets/states/search_rockets_state.dart';
import 'package:flutter_spacex/app/shared/providers/http_service_provider.dart';

class RocketsRepository implements IRocketsRepository {
  final HttpServiceProvider _serviceProvider;

  RocketsRepository(this._serviceProvider);

  @override
  Future<Either<SearchRocketError, SearchRocketsState>> getRockets() async {
    try {
      final Response response = await _serviceProvider.doGet("/v4/rockets");

      if (response.statusCode != 200) {
        return left(SearchRocketError(response.statusMessage));
      }

      var rockets =
          List<Rocket>.from(response.data.map((map) => Rocket.fromMap(map)));

      return right(SearchRocketsSuccessState(rockets));
    } catch (e) {
      return left(SearchRocketError(e.toString()));
    }
  }

  @override
  Future<Either<SearchRocketError, SearchRocketState>> getRocketById(
      String id) async {
    try {
      final Response response = await _serviceProvider.doGet("/v4/rockets/$id");

      if (response.statusCode != 200) {
        return left(SearchRocketError(response.statusMessage));
      }

      return right(SearchRocketSuccessState(Rocket.fromMap(response.data)));
    } catch (e) {
      return left(SearchRocketError(e.toString()));
    }
  }
}
