import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/fetch_clients_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/client_repository_mock.dart';

void main() async {
  final repository = ClientRepositoryMock();
  final usecase = FetchClientsUsecase(repository);
  const clientName = "Test Client";
  final client = Client(id: 1, name: clientName);

  test('Should call and pass client to repository fetch method', () async {
    await usecase(client);
    expect(repository.fetchMethodCalls, 1);
  });

  test('Should return a list of client as response', () async {
    final response = await usecase(client);
    expect(response.runtimeType, List<Client>);
  });

  test('Should return list with one client on fetch', () async {
    repository.add(client);
    final response = await usecase(client);
    expect(response, [client]);
  });
}
