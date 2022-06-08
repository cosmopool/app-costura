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
      /* final clientList = await _fetchAllUsecase(); */
      final clientList = clientsList;
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

//------------------------------------------

final client1 = Client(id: 1, name: "Tatiana Goncalves");
final client2 = Client(id: 2, name: "Alessandra Pastoral Augustina");
final client3 = Client(id: 3, name: "Valeria Pereira");
final client4 = Client(id: 4, name: "Micaela Camile Biancato");
final client5 = Client(id: 5, name: "Mariana Valaski");
final client6 = Client(id: 6, name: "Luzia dos Santos");
final client7 = Client(id: 7, name: "Lucia Amaral");
final client8 = Client(id: 8, name: "Juliana Hollanda");
final client9 = Client(id: 9, name: "Ana Julia Delphino");
final client10 = Client(id: 10, name: "Alexia Pereira");
final client11 = Client(id: 11, name: "Agusta Grustrakle");
final client12 = Client(id: 11, name: "Ivanete Lopes dos Santos");
final client13 = Client(id: 11, name: "Ivete Dos Santos");
final client14 = Client(id: 11, name: "Elizabete Lopes");

final clientsList = [
  client1,
  client2,
  client3,
  client4,
  client5,
  client6,
  client7,
  client8,
  client9,
  client10,
  client11,
  client12,
  client13,
  client14,
];
