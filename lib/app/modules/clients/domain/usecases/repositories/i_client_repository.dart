import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';

abstract class IClientRepository {
  Future<bool> add(Client client);
  Future<bool> delete(Client client);
  Future<bool> update(Client client);
  Future<List<Client>> fetchAll();
}
