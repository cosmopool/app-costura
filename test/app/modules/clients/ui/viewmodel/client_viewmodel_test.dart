import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/ui/viewmodel/client_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../stubs/client_list_stub.dart';

void main() async {
  const clientName = "Test Client";
  final client = Client(id: 1, name: clientName);

  setUp(() async {
  });

  test('Should initialize a empty clients property', () async {
    final vm = ClientViewModel();
    expect(vm.clients, []);
  });

  test('Should initialize a empty filter property', () async {
    final vm = ClientViewModel();
    expect(vm.filter, "");
  });

  test('Should return a new different instance, clients property', () async {
    final vm = ClientViewModel();
    final newVm = vm.copyWith(clients: [client]);
    expect(newVm == vm, false);
  });

  test('Should return a new different instance, filter property', () async {
    final vm = ClientViewModel();
    final newVm = vm.copyWith(filter: "new filter");
    expect(newVm == vm, false);
  });

  test('Should return a new instance with new client list', () async {
    final vm = ClientViewModel();
    final newVm = vm.copyWith(clients: [client]);
    expect(newVm.clients, [client]);
  });

  test('Should return a client when no filter is applied', () async {
    final vm = ClientViewModel(clients: listOfClients);
    expect(vm.clientsFiltered.length, listOfClients.length);
  });

  test('Should return a client list with filtered clients by "ana" in their name', () async {
    final vm = ClientViewModel(clients: listOfClients);
    final newVm = vm.copyWith(filter: "ana");
    expect(newVm.clientsFiltered.length, 4);
  });

  test('Should return a client list with filtered clients in alphabetical order', () async {
    final vm = ClientViewModel(clients: listOfClients);
    final newVm = vm.copyWith(filter: "ana");
    expect(newVm.clientsFiltered, [client9, client8, client5, client1]);
  });
}
