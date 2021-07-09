import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/app_widget.dart';
import 'package:flutter_spacex/main.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        new ModularRouter("/",
            child: (_, __) => MyHomePage(title: 'Flutter Demo Home Page'))
      ];
}
