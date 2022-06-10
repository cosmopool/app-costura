import 'package:app_costura/app/modules/clients/ui/widgets/modal_title_bar.dart';
import 'package:flutter/material.dart';

class ModalPage extends StatelessWidget {
  final List<Widget> children;
  final AssetImage assetImage;
  final String title;
  final double? imagePositionTop;
  final double? imagePositionLeft;
  final double? imagePositionRight;
  final double? imageWidth;
  final double? imageHeight;
  final Color? backgroundColor;
  final Color? iconsColor;
  final IconButton? trailingIcon;
  final bool showMenu;

  const ModalPage({
    Key? key,
    required this.children,
    required this.assetImage,
    required this.title,
    this.imagePositionTop,
    this.imagePositionLeft,
    this.imagePositionRight,
    this.imageWidth,
    this.imageHeight,
    this.backgroundColor,
    this.iconsColor,
    this.trailingIcon,
    this.showMenu = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? colors.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            left: imagePositionLeft,
            right: imagePositionRight,
            top: imagePositionTop ?? 100,
            child: Image(
              width: imageWidth,
              height: imageHeight,
              image: assetImage,
            ),
          ),
          Column(
            children: [
              showMenu
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      child: ModalTitleBar(
                        title: title,
                        iconsColor: iconsColor,
                        trailingIcon: trailingIcon,
                      ),
                    )
                  : Container(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
