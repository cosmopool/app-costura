import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/body_measurement.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/client_contact_info.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/modal_page.dart';
import 'package:flutter/material.dart';

class ClientInfoPage extends StatelessWidget {
  final Client client;
  const ClientInfoPage({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.secondaryContainer,
      body: ModalPage(
        title: client.name,
        assetImage: const AssetImage('assets/images/mannequin.png'),
        imagePositionLeft: width / 2.2,
        children: [
          BodyMeasurement(client: client),
          const SizedBox(height: 100),
          ClientContactInfo(client: client),
        ],
      ),
    );
  }
}
