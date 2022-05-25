import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/repositories/i_client_repository.dart';

class ClientRepositoryMock implements IClientRepository {
  List clientList = [];
  int addMethodCalls = 0;
  int deleteMethodCalls = 0;
  int updateMethodCalls = 0;

  @override
  Future<bool> add(Client client) async {
    addMethodCalls += 1;

    final lenghtBeforeAdd = clientList.length;
    clientList.add(client);

    return clientList.length == lenghtBeforeAdd + 1;
  }

  @override
  Future<bool> delete(Client client) async {
    deleteMethodCalls += 1;

    return clientList.remove(client);
  }

  @override
  Future<bool> update(Client client) async {
    updateMethodCalls += 1;

    final index = clientList.indexWhere((e) => e.id == client.id);
    if (index >= 0) {
      clientList[index] = client;
      return clientList[index] == client;
    } else {
      return false;
    }
  }
}
