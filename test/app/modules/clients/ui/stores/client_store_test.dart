import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/add_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/delete_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/fetch_clients_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/update_client_usecase.dart';
import 'package:app_costura/app/modules/clients/ui/stores/clients_store.dart';
import 'package:app_costura/app/modules/clients/ui/viewmodel/client_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../stubs/client_list_stub.dart';

class MockFetchClientsUsecase extends Mock implements FetchClientsUsecase {}

class MockAddClientsUsecase extends Mock implements AddClientUsecase {}

class MockUpdateClientsUsecase extends Mock implements UpdateClientUsecase {}

class MockDeleteClientsUsecase extends Mock implements DeleteClientUsecase {}

void main() async {
  const clientName = "Test Client";
  final client = Client(id: 1, name: clientName);
  final fetchUsecase = MockFetchClientsUsecase();
  final addUsecase = MockAddClientsUsecase();
  final updateUsecase = MockUpdateClientsUsecase();
  final deleteUsecase = MockDeleteClientsUsecase();
  late ClientStore clientStore;

  setUp(() async {
    clientStore = ClientStore(fetchUsecase, addUsecase, updateUsecase, deleteUsecase);
    registerFallbackValue(Client(id: 66, name: "Stub"));
  });

  test('Should start with empty viewmodel state', () async {
    expect(clientStore.state, ClientViewModel());
  });

  test('Should update the state to show a new client list', () async {
    // arrange
    when(fetchUsecase.call).thenAnswer((_) async => [client]);
    // act
    await clientStore.fetchAll();
    expect(clientStore.state, ClientViewModel(clients: [client], filter: ""));
  });

  test('Should update to a new state with a filtered client list', () async {
    // arrange
    when(fetchUsecase.call).thenAnswer((_) async => listOfClients);
    await clientStore.fetchAll();
    // act
    clientStore.filterClients("ai");
    expect(clientStore.state,
        ClientViewModel(clients: listOfClients, filter: "ai"));
  });

  // ------------------------------------------------------ ADD METHOD TESTS

  test('Should add a new client to clientList', () async {
    // arrange
    when(fetchUsecase.call).thenAnswer((_) async => listOfClients);
    when(() => addUsecase.call(any())).thenAnswer((_) async => true);
    await clientStore.fetchAll();
    final newClient = Client(id: 20, name: "Azazel");
    List<Client> newClientList = List.from(listOfClients);
    newClientList.add(newClient);
    // act
    await clientStore.add(newClient);
    expect(clientStore.state, ClientViewModel(clients: newClientList));
  });

  // ------------------------------------------------------ DELETE METHOD TESTS

  test('Should call delete usecase', () async {
    // arrange
    when(() => deleteUsecase.call(any())).thenAnswer((_) async => true);
    clientStore.delete(client);
    verify(() => deleteUsecase(client)).called(2);

  });

}
