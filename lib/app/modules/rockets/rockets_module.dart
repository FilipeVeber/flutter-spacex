import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/modules/rockets/repositories/rocket_repository.dart';
import 'package:flutter_spacex/app/modules/rockets/stores/rocket_store.dart';

import 'screens/rockets_screen.dart';

class RocketsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RocketRepository(i())),
        Bind((i) => RocketStore(i())),
      ];

  @override
  List<ModularRouter> get routers =>
      [new ModularRouter("/", child: (_, __) => RocketsScreen())];
}
