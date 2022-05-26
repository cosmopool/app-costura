import 'package:app_costura/app/modules/clients/data/datasources/local/hive_datasource.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/add_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/delete_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/fetch_clients_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/update_client_usecase.dart';
import 'package:app_costura/app/modules/clients/infra/repositories/client_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

class ClientsModule extends Module {
  @override
  List<Bind> get binds => [
        // Here it goes all dependency injection
        // datasources
        Bind.lazySingleton((i) => HiveDatasource(Hive.box("agenda"))),
        // repositories
        Bind.lazySingleton((i) => ClientRepository(i())),
        // usecases
        Bind.lazySingleton((i) => AddClientUsecase(i())),
        Bind.lazySingleton((i) => DeleteClientUsecase(i())),
        Bind.lazySingleton((i) => FetchClientsUsecase(i())),
        Bind.lazySingleton((i) => UpdateClientUsecase(i())),
        // stores
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ClientSearchPage(), children: [
        /* ChildRoute('/client/info', child: (context, args) => const ClientInfoPage()), */
        /* ChildRoute('/client/info/edit', child: (context, args) => const ClientEditPage(), transition: TransitionType.rightToLeftWithFade), */
        ],
        ),
      ];
}
