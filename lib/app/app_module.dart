import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/app_widget.dart';
import 'package:flutter_spacex/app/modules/home/home_module.dart';
import 'package:flutter_spacex/app/modules/rockets/rockets_module.dart';
import 'package:flutter_spacex/app/shared/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((_) => Dio(BaseOptions(baseUrl: Constants.BASE_URL))),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        new ModularRouter("/", module: HomeModule()),
        new ModularRouter("/rockets", module: RocketsModule())
      ];
}
