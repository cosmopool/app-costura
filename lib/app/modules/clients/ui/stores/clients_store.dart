import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/add_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/delete_client_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/fetch_clients_usecase.dart';
import 'package:app_costura/app/modules/clients/domain/usecases/update_client_usecase.dart';
import 'package:app_costura/app/modules/clients/ui/viewmodel/client_viewmodel.dart';
import 'package:app_costura/app/modules/core/errors/failures.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'dart:math';

class ClientStore extends NotifierStore<Failure, ClientViewModel> {
  final FetchClientsUsecase _fetchAllUsecase;
  final AddClientUsecase _addUsecase;
  final UpdateClientUsecase _updateUsecase;
  final DeleteClientUsecase _deleteUsecase;

  ClientStore(
    this._fetchAllUsecase,
    this._addUsecase,
    this._updateUsecase,
    this._deleteUsecase,
  ) : super(ClientViewModel());

  /// Filter the client list by [clientName]
  void filterClients(String clientName) {
    update(state.copyWith(filter: clientName));
  }

  /// Fetch all clients
  Future<void> fetchAll() async {
    try {
      setLoading(true);
      var clientList = await _fetchAllUsecase();
      /* clientList = getStubClientList(); */
      print("---------------------  thats the client List length: ${clientList.length}");
      print("---------------------  current state: ${state.clientsFiltered}");
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
        /* final clientList = await _fetchAllUsecase(); */
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

  /// Edit a [client] properties
  Future<void> edit(Client client) async {
    try {
      setLoading(true);
      final response = await _updateUsecase(client);
      if (response == true) {
        final clientList = await _fetchAllUsecase();
        update(state.copyWith(clients: clientList));
      } else {
        setError(CouldNotEditClient());
      }
    } catch (e) {
      setError(CouldNotEditClient());
    } finally {
      setLoading(false);
    }
  }

  /// Deletes a [client] properties
  Future<void> delete(Client client) async {
  print("---------------------  deleting client: ${client.name}");
    try {
      setLoading(true);
      final response = await _deleteUsecase(client);
      if (response == true) {
        final clientList = await _fetchAllUsecase();
        update(state.copyWith(clients: clientList));
      } else {
        setError(CouldNotDeleteClient());
      }
    } catch (e) {
      setError(CouldNotDeleteClient());
    } finally {
      setLoading(false);
    }
  }
}
