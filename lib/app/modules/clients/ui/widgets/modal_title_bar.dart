import 'package:app_costura/app/modules/clients/ui/widgets/text_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalTitleBar extends StatelessWidget {
  final String title;
  const ModalTitleBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /* Flexible( */
        /*   flex: 1, */
        /*   fit: FlexFit.loose, */
        /*   child: IconButton( */
        /*     color: colors.secondaryContainer, */
        /*     icon: const Icon(Icons.arrow_back), */
        /*     onPressed: () => print('go back pls'), */
        /*   ), */
        /* ), */
        /* Flexible( */
        /*   flex: 6, */
        /*   fit: FlexFit.loose, */
        /*   child: Text( */
        /*     title, */
        /*     style: textTheme.headlineMedium?.copyWith( */
        /*       color: colors.secondaryContainer, */
        /*     ), */
        /*   ), */
        /* ), */
        /* Flexible( */
        /*   flex: 1, */
        /*   fit: FlexFit.loose, */
        /*   child: IconButton( */
        /*     color: colors.secondaryContainer, */
        /*     icon: const Icon(Icons.edit), */
        /*     onPressed: () => print('go back pls'), */
        /*   ), */
        /* ), */
        SizedBox(
          /* width: 50, */
          width: width * 0.1,
          child: IconButton(
            color: colors.secondaryContainer,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Modular.to.pop(),
          ),
        ),
        SizedBox(
          /* width: width - 120, */
          width: width * 0.75,
          child: Text(
            title,
            style: textTheme.headlineMedium?.copyWith(
              color: colors.secondaryContainer,
            ),
          ),
        ),
        SizedBox(
          /* width: 50, */
          width: width * 0.1,
          child: IconButton(
            color: colors.secondaryContainer,
            icon: const Icon(Icons.edit),
            onPressed: () => print('go back pls'),
          ),
        ),
      ],
    );
    /* return LayoutBuilder( */
    /*   builder: (context, constraints) => Row( */
    /*     mainAxisSize: MainAxisSize.min, */
    /*     mainAxisAlignment: MainAxisAlignment.end, */
    /*     children: [ */
    /*       SizedBox( */
    /*         width: width * 0.1, */
    /*         child: IconButton( */
    /*           color: colors.secondaryContainer, */
    /*           icon: const Icon(Icons.arrow_back), */
    /*           onPressed: () => print('go back pls'), */
    /*         ), */
    /*       ), */
    /*       SizedBox( */
    /*         width: constraints.maxWidth * 0.1, */
    /*         child: Text( */
    /*           title, */
    /*           style: textTheme.headlineMedium?.copyWith( */
    /*             color: colors.secondaryContainer, */
    /*           ), */
    /*         ), */
    /*       ), */
    /*       SizedBox( */
    /*         width: width * 0.1, */
    /*         child: IconButton( */
    /*           color: colors.secondaryContainer, */
    /*           icon: const Icon(Icons.edit), */
    /*           onPressed: () => print('go back pls'), */
    /*         ), */
    /*       ), */
    /*     ], */
    /*   ), */
    /* ); */
  }
}
