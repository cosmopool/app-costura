import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import 'package:app_costura/app/modules/clients/data/datasources/local/hive_datasource.dart';
import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';

void main() async {
  late Box box;
  late HiveDatasource cache;
  const clientName = "Test Client";
  final client = Client(id: 1, name: clientName);

  Hive.registerAdapter(ClientAdapter());

  setUp(() async {
    await setUpTestHive();
    box = await Hive.openBox<Client>('testBox');
    cache = HiveDatasource(box);
  });

  // ------------------------------------------------------ ADD METHOD TESTS

  test('Should return bool when called add method', () async {
    final response = await cache.add(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when trying to add a valid client', () async {
    final response = await cache.add(client);
    expect(response, true);
  });

  test('Should save a client at position 1', () async {
    expect(box.get(1, defaultValue: null), null);
    await cache.add(client);
    expect(box.get(1, defaultValue: null), client);
  });

  test('Should save a client with negative id', () async {
    // arrange
    final newClient = Client(id: -1, name: "asdf");
    final keysBefore = box.keys.length;
    // act
    await cache.add(newClient);
    // assert
    expect(box.keys.length, keysBefore + 1);
  });

  test('Should get a new id if client.id is -1', () async {
    // arrange
    const name = "Negative id client";
    final newClient = Client(id: -1, name: name);
    await cache.add(Client(id: 1, name: "asdf"));
    await cache.add(Client(id: 2, name: "sdfa"));
    await cache.add(Client(id: 3, name: "glfz"));
    // act
    await cache.add(newClient);
    // assert
    final finalClient = box.get(4);
    expect(finalClient, Client(id: 4, name: name));
  });

  // ------------------------------------------------------ DELETE METHOD TESTS

  test('Should return bool when called add method', () async {
    final response = await cache.delete(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when deleted a client', () async {
    cache.add(client);
    final response = await cache.delete(client);
    expect(response, true);
  });

  // ------------------------------------------------------ FETCH METHOD TESTS

  test('Should return a list of client as response', () async {
    final response = await cache.fetchAll();
    expect(response.runtimeType, List<Client>);
  });

  test('Should return list with one client on fetch', () async {
    await cache.add(client);
    final response = await cache.fetchAll();
    expect(response, [client]);
  });

  // ------------------------------------------------------ UPDATE METHOD TESTS

  test('Should return a bool as response', () async {
    final response = await cache.update(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when trying to update a valid client', () async {
    cache.add(client);
    final response = await cache.update(client);
    expect(response, true);
  });

  test('Should return false when trying to update a non existent client',
      () async {
    cache.delete(client);
    final response = await cache.update(client);
    expect(response, false);
  });

  tearDown(() async {
    await tearDownTestHive();
  });
}
