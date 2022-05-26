import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/infra/repositories/client_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/hive_datasource_mock.dart';

void main() async {
  late HiveDatasourceMock cache;
  late ClientRepository repo;
  late Client client;
  const clientName = "Test Client";

  setUp(() async {
    cache = HiveDatasourceMock();
    repo = ClientRepository(cache);
    client = Client(id: 1, name: clientName);
  });

  // ------------------------------------------------------ ADD METHOD TESTS

  test('Should call and pass client to repository add method', () async {
    await repo.add(client);
    expect(cache.addMethodCalls, 1);
  });

  test('Should return a bool as response', () async {
    final response = await repo.add(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when trying to add a valid client', () async {
    final response = await repo.add(client);
    expect(response, true);
  });

  // ------------------------------------------------------ DELETE METHOD TESTS

  test('Should call and pass client to repository delete method', () async {
    await repo.delete(client);
    expect(cache.deleteMethodCalls, 1);
  });

  test('Should return a bool as response', () async {
    final response = await repo.delete(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when trying to delete a valid client', () async {
    cache.add(client);
    final response = await repo.delete(client);
    expect(response, true);
  });

  test('Should return false when trying to remove a non existent client',
      () async {
    final response = await repo.delete(client);
    expect(response, false);
  });

  // ------------------------------------------------------ FETCH METHOD TESTS

  test('Should call and pass client to repository fetch method', () async {
    await repo.fetchAll();
    expect(cache.fetchMethodCalls, 1);
  });

  test('Should return a list of client as response', () async {
    final response = await repo.fetchAll();
    expect(response.runtimeType, List<Client>);
  });

  test('Should return list with one client on fetch', () async {
    cache.add(client);
    final response = await repo.fetchAll();
    expect(response, [client]);
  });

  // ------------------------------------------------------ UPDATE METHOD TESTS

  test('Should call and pass client to cache update method', () async {
    await repo.update(client);
    expect(cache.updateMethodCalls, 1);
  });

  test('Should return a bool as response', () async {
    final response = await repo.update(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when trying to update a valid client', () async {
    cache.add(client);
    final response = await repo.update(client);
    expect(response, true);
  });

  test('Should return false when trying to update a non existent client',
      () async {
    final response = await repo.update(client);
    expect(response, false);
  });
}
