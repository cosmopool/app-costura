import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/delete_client_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/client_repository_mock.dart';

void main() async {
  final repository = ClientRepositoryMock();
  final usecase = DeleteClientUsecase(repository);
  const clientName = "Test Client";
  final client = Client(id: 1, name: clientName);

  test('Should call and pass client to repository delete method', () async {
    await usecase(client);
    expect(repository.deleteMethodCalls, 1);
  });

  test('Should return a bool as response', () async {
    final response = await usecase(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when trying to delete a valid client', () async {
    repository.add(client);
    final response = await usecase(client);
    expect(response, true);
  });

  test('Should return false when trying to remove a non existent client', () async {
    final response = await usecase(client);
    expect(response, false);
  });
}
