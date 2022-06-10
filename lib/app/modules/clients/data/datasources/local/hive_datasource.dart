import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/infra/datasources/i_local_datasource.dart';
import 'package:hive/hive.dart';

class HiveDatasource implements ILocalDatasource {
  final Box box;
  HiveDatasource(this.box);

  /// Checks whether a given [client] is saved in cache
  bool _containsClient(Client client) {
    return box.containsKey(client.id);
  }

  /// Compare if client with id [clientId] is the same as [client]
  bool _compareClient(int clientId, Client client) {
    return box.get(clientId, defaultValue: null) == client;
  }

  @override
  Future<bool> add(Client client) async {
    late Client finalClient;

    (client.id == -1)
        ? finalClient = client.copyWith(id: box.keys.length + 1)
        : finalClient = client;

    await box.put(finalClient.id, finalClient);
    return _compareClient(finalClient.id, finalClient);
  }

  /// Deletes a client from a given [client.id]
  ///
  /// Returns true if there's no client with given [client.id] left in cache
  /// Returns false otherwise
  @override
  Future<bool> delete(Client client) async {
    await box.delete(client.id);
    return !_containsClient(client);
  }

  @override
  Future<List<Client>> fetchAll() async {
    List<Client> clientList = [];

    final clients = box.values;
    for (var client in clients) {
      clientList.add(client);
    }

    return clientList;
  }

  @override
  Future<bool> update(Client client) async {
    if (box.containsKey(client.id)) {
      await box.put(client.id, client);
      return _compareClient(client.id, client);
    } else {
      // TODO: implement meaningful errors
      // throw NoClientWithGivenId
      return false;
    }
  }
}
