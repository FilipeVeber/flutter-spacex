import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/modules/home/screens/home_screen.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers =>
      [new ModularRouter("/home", child: (_, __) => HomeScreen())];
}
