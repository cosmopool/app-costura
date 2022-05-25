import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/repositories/i_client_repository.dart';

class AddClientUsecase {
  final IClientRepository repository;
  AddClientUsecase(this.repository);

  Future<bool> call(Client client) async => await repository.add(client);
}
