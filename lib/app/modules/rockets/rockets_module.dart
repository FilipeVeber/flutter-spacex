import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/modules/rockets/repositories/rockets_repository.dart';
import 'package:flutter_spacex/app/modules/rockets/screens/rocket_details_screen.dart';
import 'package:flutter_spacex/app/modules/rockets/stores/rocket_details_store.dart';
import 'package:flutter_spacex/app/modules/rockets/stores/rocket_store.dart';

import 'screens/rockets_screen.dart';

class RocketsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RocketsRepository(i())),
        Bind((i) => RocketStore(i())),
        Bind((i) => RocketDetailsStore(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, __) => RocketsScreen()),
        ModularRouter("/rocket/:id",
            child: (_, args) => RocketDetailsScreen(args.data["id"])),
      ];
}
