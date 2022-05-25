import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/repositories/i_client_repository.dart';

class UpdateClientUsecase {
  final IClientRepository repository;
  UpdateClientUsecase(this.repository);

  Future<bool> call(Client client) async => await repository.update(client);
}
