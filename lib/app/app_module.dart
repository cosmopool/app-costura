import 'package:app_costura/app/modules/clients/clients_module.dart';
import 'package:app_costura/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [
        ClientsModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: HomeModule()),
        ModuleRoute("/clients", module: ClientsModule()),
      ];
}
