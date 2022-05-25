import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/add_client_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/client_repository_mock.dart';

void main() async {
  final repository = ClientRepositoryMock();
  final usecase = AddClientUsecase(repository);
  const clientName = "Test Client";
  final client = Client(id: 1, name: clientName);

  test('Should call and pass client to repository add method', () async {
    await usecase(client);
    expect(repository.addMethodCalls, 1);
  });

  test('Should return a bool as response', () async {
    final response = await usecase(client);
    expect(response.runtimeType, bool);
  });

  test('Should return true when trying to add a valid client', () async {
    final response = await usecase(client);
    expect(response, true);
  });
}
