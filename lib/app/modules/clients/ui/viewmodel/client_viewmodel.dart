import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:equatable/equatable.dart';

class ClientViewModel extends Equatable {
  late final List<Client> clients;
  late final String filter;
  List<Client> get clientsFiltered {
    final c = clients
        .where((e) => e.name.toUpperCase().contains(filter.toUpperCase())).toList();
    c.sort((a, b) => a.name.compareTo(b.name));
    return c;
  }

  ClientViewModel({
    List<Client>? clients,
    String? filter,
  }) {
    this.clients = clients ?? [];
    this.filter = filter ?? "";
  }

  /// Returns a new copy of the instance with new values
  ClientViewModel copyWith({
    List<Client>? clients,
    String? filter,
  }) {
    return ClientViewModel(
      clients: clients ?? this.clients,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [clients, filter, clientsFiltered];
}
