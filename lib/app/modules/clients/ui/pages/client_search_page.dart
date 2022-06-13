import 'package:app_costura/app/modules/clients/ui/stores/clients_store.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/client_contact_widget.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/modal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ClientSearchPage extends StatefulWidget {
  const ClientSearchPage({Key? key}) : super(key: key);

  @override
  State<ClientSearchPage> createState() => _ClientSearchPageState();
}

class _ClientSearchPageState extends State<ClientSearchPage> {
  final store = Modular.get<ClientStore>();

  @override
  void initState() {
    super.initState();
    store.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.secondaryContainer,
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.add),
        onPressed: () => Modular.to.pushNamed('./add'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.05,
              ),
              child: TextField(
                onChanged: (String filter) => store.filterClients(filter),
                decoration: const InputDecoration(
                  hintText: 'Nome do cliente',
                ),
              ),
            ),
            Expanded(
              child: ModalPage(
                title: 'Clientes',
                showMenu: false,
                assetImage: const AssetImage('assets/images/needle.png'),
                imageWidth: width * 0.3,
                imagePositionTop: 50,
                imagePositionRight: 0,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: ScopedBuilder(
                        store: store,
                        // TODO: implement error widget or screen
                        onError: (_, error) => Text("$error"),
                        onLoading: (_) => const CircularProgressIndicator(),
                        onState: (_, state) => ListView.separated(
                          separatorBuilder: (_, __) => SizedBox(
                            height: height * 0.05,
                          ),
                          itemCount: store.state.clientsFiltered.length,
                          itemBuilder: (_, index) {
                            final client = store.state.clientsFiltered[index];

                            return ClientContactWidget(
                              client: client,
                              onTap: () => Modular.to
                                  .pushNamed('./info', arguments: client),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
