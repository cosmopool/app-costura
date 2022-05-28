import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/fetch_clients_usecase.dart';
import 'package:app_costura/app/modules/clients/ui/stores/clients_store.dart';
import 'package:app_costura/app/modules/clients/ui/viewmodel/client_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../stubs/client_list_stub.dart';

class MockFetchClientsUsecase extends Mock implements FetchClientsUsecase {}

void main() async {
  const clientName = "Test Client";
  final client = Client(id: 1, name: clientName);
  final fetchUsecase = MockFetchClientsUsecase();
  final clientStore = ClientStore(fetchUsecase);

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
    expect(clientStore.state, ClientViewModel(clients: listOfClients, filter: "ai"));
  });
}
