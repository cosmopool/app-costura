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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BodyMeasurementRow(measurement: "Busto", size: client.bust,),
        BodyMeasurementRow(measurement: "Cintura", size: client.waist,),
        BodyMeasurementRow(
            measurement: "Altura do Busto", size: client.bustHeight),
        BodyMeasurementRow(
            measurement: "Comprimento do Corpo", size: client.torso),
        BodyMeasurementRow(
            measurement: "Comprimento da Manga", size: client.sleeveLenght),
        BodyMeasurementRow(
            measurement: "Comprimento da calça", size: client.pants),
        BodyMeasurementRow(
            measurement: "Largura do braço", size: client.biceps),
        BodyMeasurementRow(measurement: "Quadril", size: client.hip),
        BodyMeasurementRow(measurement: "Costas", size: client.shoulderWidth),
      ],
    );
  }
}
