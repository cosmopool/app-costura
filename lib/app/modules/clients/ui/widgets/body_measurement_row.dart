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
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
            flex: 1, child: TextLine(text: "$size", textAlign: TextAlign.end)),
        Flexible(flex: 1, child: SizedBox(width: width * 0.01)),
        Flexible(
          flex: 1,
          child: Text(
            "cm",
            style: textTheme.bodyLarge?.copyWith(
              color: colors.secondaryContainer,
            ),
          ),
        ),
        Flexible(flex: 1, child: SizedBox(width: width * 0.05)),
        Flexible(flex: 5, child: TextLine(text: measurement)),
      ],
    );
  }
}
