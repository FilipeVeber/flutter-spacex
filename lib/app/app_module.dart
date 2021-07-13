import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/app_widget.dart';
import 'package:flutter_spacex/app/modules/home/home_module.dart';
import 'package:flutter_spacex/app/modules/rockets/rockets_module.dart';
import 'package:flutter_spacex/app/shared/providers/http_service_provider.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((_) => HttpServiceProvider()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        new ModularRouter("/", module: HomeModule()),
        new ModularRouter("/rockets", module: RocketsModule())
      ];
}
