import 'package:flutter/material.dart';

class TextLine extends StatelessWidget {
  final String text;
  final double? lineLenghtFactor;
  final TextAlign? textAlign;

  const TextLine({
    Key? key,
    required this.text,
    this.lineLenghtFactor,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width * (lineLenghtFactor ?? 0.7),
      child: Text(
        text,
        textAlign: textAlign,
        style: textTheme.headlineSmall?.copyWith(
          color: colors.secondaryContainer,
        ),
      ),
    );
  }
}
