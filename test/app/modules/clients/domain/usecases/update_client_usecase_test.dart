import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/update_client_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/client_repository_mock.dart';

void main() async {
  final repository = ClientRepositoryMock();
  final usecase = UpdateClientUsecase(repository);
  const clientName = "Test Client";
  final client = Client(id: 1, name: clientName);

  test('Should call and pass client to repository update method', () async {
    await usecase(client);
    expect(repository.updateMethodCalls, 1);
  });

  test('Should return a bool as response', () async {
    final response = await usecase(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when trying to update a valid client', () async {
    repository.add(client);
    final response = await usecase(client);
    expect(response, true);
  });

  test('Should return false when trying to update a non existent client', () async {
    repository.delete(client);
    final response = await usecase(client);
    expect(response, false);
  });
}
