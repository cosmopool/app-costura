import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/repositories/i_client_repository.dart';
import 'package:app_costura/app/modules/clients/infra/datasources/i_local_datasource.dart';

class ClientRepository implements IClientRepository {
  final ILocalDatasource cache;
  ClientRepository(this.cache);

  @override
  Future<bool> add(Client client) async {
    return await cache.add(client);
  }

  @override
  Future<bool> delete(Client client) async {
    return await cache.delete(client);
  }

  @override
  Future<List<Client>> fetch(Client client) async {
    return await cache.fetch(client);
  }

  @override
  Future<bool> update(Client client) async {
    return await cache.update(client);
  }
}
