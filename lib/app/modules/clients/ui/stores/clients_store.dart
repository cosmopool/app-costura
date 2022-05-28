import 'package:app_costura/app/modules/clients/domain/usecases/fetch_clients_usecase.dart';
import 'package:app_costura/app/modules/clients/ui/viewmodel/client_viewmodel.dart';
import 'package:app_costura/app/modules/core/errors/failures.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ClientStore extends NotifierStore<Failure, ClientViewModel> {
  final FetchClientsUsecase _fetchAllUsecase;

  ClientStore(this._fetchAllUsecase) : super(ClientViewModel());

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
}
