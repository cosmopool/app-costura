import 'package:app_costura/app/modules/clients/ui/stores/clients_store.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/client_contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ClientSearchPage extends StatelessWidget {
  const ClientSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;
    final store = Modular.get<ClientStore>();
    store.fetchAll();

    return Scaffold(
      backgroundColor: colors.secondaryContainer,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // TODO: implement client add screen
        onPressed: () => print("Modular.to.pushNamed('/client/add')"),
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
            LayoutBuilder(
              builder: (_, constraints) => Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.05,
                  horizontal: width * 0.1,
                ),
                height: height,
                width: constraints.maxWidth,
                // TODO: make needle background image smaller
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/needle.png'),
                    fit: BoxFit.scaleDown,
                  ),
                  color: colors.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ScopedBuilder(
                  store: store,
                  // TODO: implement error widget or screen
                  onError: (_, error) => Text("$error"),
                  onLoading: (_) => const CircularProgressIndicator(),
                  onState: (_, state) => ListView.separated(
                    separatorBuilder: (_, __) => SizedBox(
                      height: height * 0.05,
                      /* child: Divider(color: colors.secondaryContainer), */
                    ),
                    itemCount: store.state.clientsFiltered.length,
                    itemBuilder: (_, index) {
                      final client = store.state.clientsFiltered[index];

                      return ClientContactWidget(
                        client: client,
                        onTap: () =>
                            Modular.to.pushNamed('./info', arguments: client),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
