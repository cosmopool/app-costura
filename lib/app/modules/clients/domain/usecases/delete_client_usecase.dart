import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/repositories/i_client_repository.dart';

class DeleteClientUsecase {
  final IClientRepository repository;
  DeleteClientUsecase(this.repository);

  Future<bool> call(Client client) async => await repository.delete(client);
}
