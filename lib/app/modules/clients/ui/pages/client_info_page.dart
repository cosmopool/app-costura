import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/body_measurement.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/client_contact_info.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/modal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientInfoPage extends StatelessWidget {
  final Client client;
  const ClientInfoPage({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.secondaryContainer,
      body: SafeArea(
        child: ModalPage(
          title: client.name,
          assetImage: const AssetImage('assets/images/mannequin.png'),
          imagePositionLeft: width / 2.2,
          imageHeight: height * 0.8,
          imagePositionTop: (height * 0.2) / 2,
          trailingIcon: IconButton(
            color: colors.secondaryContainer,
            icon: const Icon(Icons.edit),
            onPressed: () => Modular.to.pushNamed('./edit', arguments: client),
          ),
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: ListView(
                  children: [
                    BodyMeasurement(client: client),
                    const SizedBox(height: 40),
                    Divider(color: colors.secondaryContainer),
                    ClientContactInfo(client: client),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
