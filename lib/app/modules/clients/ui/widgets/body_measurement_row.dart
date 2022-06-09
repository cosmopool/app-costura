import 'package:app_costura/app/modules/clients/ui/widgets/text_line.dart';
import 'package:flutter/material.dart';

class BodyMeasurementRow extends StatelessWidget {
  final String measurement;
  final int size;

  const BodyMeasurementRow({
    Key? key,
    required this.measurement,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(flex: 2, child: TextLine(text: "$size cm", lineLenghtFactor: 0.15, textAlign: TextAlign.end)),
        Flexible(flex: 1, child: SizedBox(width: width * 0.05)),
        Flexible(flex: 5, child: TextLine(text: measurement, lineLenghtFactor: 0.5)),
      ],
    );
  }
}
