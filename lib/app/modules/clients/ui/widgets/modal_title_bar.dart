import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalTitleBar extends StatelessWidget {
  final String title;
  final Color? iconsColor;
  final IconButton? trailingIcon;

  const ModalTitleBar({
    Key? key,
    required this.title,
    this.iconsColor,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: width * 0.1,
          child: IconButton(
            color: iconsColor ?? colors.secondaryContainer,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Modular.to.pop(),
          ),
        ),
        SizedBox(
          width: width * 0.75,
          child: Text(
            title,
            style: textTheme.headlineMedium?.copyWith(
              color: iconsColor ?? colors.secondaryContainer,
            ),
          ),
        ),
        (trailingIcon != null) ? SizedBox(
          width: width * 0.1,
          child: trailingIcon,
        ) : Container(),
      ],
    );
  }
}
