import 'package:app_costura/app/modules/clients/ui/widgets/modal_title_bar.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/text_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalPage extends StatelessWidget {
  final List<Widget> children;
  final AssetImage assetImage;
  final String title;
  final double? imagePositionTop;
  final double? imagePositionLeft;
  final double? imagePositionRight;
  final double? imageWidth;
  final double? imageHeight;
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
    this.showMenu = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (_, constraints) => Column(children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.05,
                        horizontal: width * 0.1,
                      ),
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                    ),
                    Positioned(
                      left: imagePositionLeft,
                      right: imagePositionRight,
                      top: imagePositionTop,
                      child: Image(
                        width: imageWidth,
                        height: imageHeight,
                        image: assetImage,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: ModalTitleBar(title: title),
                    ),
                    /* Positioned( */
                    /*   top: 10, */
                    /*   left: 10, */
                    /*   child: IconButton( */
                    /*     color: colors.secondaryContainer, */
                    /*     icon: const Icon(Icons.arrow_back), */
                    /*     onPressed: () => Modular.to.maybePop(), */
                    /*   ), */
                    /* ), */
                    /* Positioned( */
                    /*   top: 10, */
                    /*   left: 60, */
                    /*   child: Text( */
                    /*     title, */
                    /*     style: textTheme.headlineMedium?.copyWith( */
                    /*       color: colors.secondaryContainer, */
                    /*     ), */
                    /*   ), */
                    /* ), */
                    /* Positioned( */
                    /*   top: 10, */
                    /*   right: 10, */
                    /*   child: IconButton( */
                    /*     color: colors.secondaryContainer, */
                    /*     icon: const Icon(Icons.edit), */
                    /*     onPressed: () => print('go back pls'), */
                    /*   ), */
                    /* ), */
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
