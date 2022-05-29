import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/add_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/fetch_clients_usecase.dart';
import 'package:app_costura/app/modules/clients/ui/viewmodel/client_viewmodel.dart';
import 'package:app_costura/app/modules/core/errors/failures.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ClientStore extends NotifierStore<Failure, ClientViewModel> {
  final FetchClientsUsecase _fetchAllUsecase;
  final AddClientUsecase _addUsecase;

  ClientStore(
    this._fetchAllUsecase,
    this._addUsecase,
  ) : super(ClientViewModel());

  /// Filter the client list by [clientName]
  void filterClients(String clientName) {
    update(state.copyWith(filter: clientName));
  }

  /// Fetch all clients
  Future<void> fetchAll() async {
    try {
      setLoading(true);
      final clientList = await _fetchAllUsecase();
      update(state.copyWith(clients: clientList));
    } catch (e) {
      setError(CouldNotFetchClients());
    } finally {
      setLoading(false);
    }
  }

  /// Add a [client] to client list
  Future<void> add(Client client) async {
    try {
      setLoading(true);
      final response = await _addUsecase(client);
      if (response == true) {
        final clientList = List<Client>.from(state.clients);
        clientList.add(client);
        update(state.copyWith(clients: clientList));
      } else {
        setError(CouldNotAddClient());
      }
    } catch (e) {
      setError(CouldNotAddClient());
    } finally {
      setLoading(false);
    }
  }
}
