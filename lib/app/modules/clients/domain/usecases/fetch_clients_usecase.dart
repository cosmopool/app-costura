import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/repositories/i_client_repository.dart';

class FetchClientsUsecase {
  final IClientRepository repository;
  FetchClientsUsecase(this.repository);

  Future<List<Client>> call() async => await repository.fetchAll();
}
