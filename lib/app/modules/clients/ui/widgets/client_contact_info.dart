import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/text_line.dart';
import 'package:flutter/material.dart';

class ClientContactInfo extends StatelessWidget {
  final Client client;

  const ClientContactInfo({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              color: colors.secondaryContainer,
              icon: const Icon(Icons.phone),
              // TODO: open phone app or whatsapp
              onPressed: () => print("--------------> go to phone"),
            ),
            /* const TextLine(text: "Telefone:", lineLenghtFactor: 0.2), */
            SizedBox(width: width * 0.05),
            TextLine(text: client.phone, lineLenghtFactor: 0.45),
          ],
        ),
      ],
    );
  }
}
