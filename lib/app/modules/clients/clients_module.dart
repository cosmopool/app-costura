import 'package:app_costura/app/modules/clients/data/datasources/local/hive_datasource.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/add_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/delete_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/fetch_clients_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/update_client_usecase.dart';
import 'package:app_costura/app/modules/clients/infra/repositories/client_repository.dart';
import 'package:app_costura/app/modules/clients/ui/pages/client_add_page.dart';
import 'package:app_costura/app/modules/clients/ui/pages/client_info_page.dart';
import 'package:app_costura/app/modules/clients/ui/pages/client_search_page.dart';
import 'package:app_costura/app/modules/clients/ui/stores/clients_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

class ClientsModule extends Module {
  @override
  List<Bind> get binds => [
        // Here it goes all dependency injection
        // datasources
        Bind.lazySingleton((i) => HiveDatasource(Hive.box("clients")), export: true),
        // repositories
        Bind.lazySingleton((i) => ClientRepository(i()), export: true),
        // usecases
        Bind.lazySingleton((i) => AddClientUsecase(i()), export: true),
        Bind.lazySingleton((i) => DeleteClientUsecase(i()), export: true),
        Bind.lazySingleton((i) => FetchClientsUsecase(i()), export: true),
        Bind.lazySingleton((i) => UpdateClientUsecase(i()), export: true),
        // stores
        Bind.lazySingleton((i) => ClientStore(i(), i(), i()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ClientSearchPage(), transition: TransitionType.fadeIn),
        ChildRoute('/info', child: (context, args) => ClientInfoPage(client: args.data), transition: TransitionType.downToUp),
        ChildRoute('/add', child: (context, args) => const ClientAddPage(), transition: TransitionType.downToUp),
      ];
}
