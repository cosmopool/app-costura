import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/body_measurement_row.dart';
import 'package:flutter/material.dart';

class BodyMeasurement extends StatelessWidget {
  final Client client;

  const BodyMeasurement({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final divider = Divider(color: colors.secondaryContainer);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BodyMeasurementRow(
          measurement: "Busto",
          size: client.bust,
        ),
        divider,
        BodyMeasurementRow(
          measurement: "Cintura",
          size: client.waist,
        ),
        divider,
        BodyMeasurementRow(
          measurement: "Altura do Busto",
          size: client.bustHeight,
        ),
        divider,
        BodyMeasurementRow(
          measurement: "Comprimento do Corpo",
          size: client.torso,
        ),
        divider,
        BodyMeasurementRow(
          measurement: "Comprimento da Manga",
          size: client.sleeveLenght,
        ),
        divider,
        BodyMeasurementRow(
          measurement: "Comprimento da calça",
          size: client.pants,
        ),
        divider,
        BodyMeasurementRow(
          measurement: "Largura do braço",
          size: client.biceps,
        ),
        divider,
        BodyMeasurementRow(
          measurement: "Quadril",
          size: client.hip,
        ),
        divider,
        BodyMeasurementRow(
          measurement: "Costas",
          size: client.shoulderWidth,
        ),
      ],
    );
  }
}
