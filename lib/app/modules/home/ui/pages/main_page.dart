import 'package:app_costura/app/modules/home/ui/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.secondaryContainer,
      body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: MainButton(
                    title: "Selecione uma atividade",
                    heightFactor: 0.45,
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                    textStyle: textStyle.headlineMedium!,
                    textColor: colors.primary,
                    wrapTextFactor: 0.7,
                    iconAsset: 'assets/images/machine.png',
                    iconColor: colors.primary,
                  ),
                ),
                MainButton(
                  title: "Clientes",
                  backgroundColor: colors.onPrimaryContainer,
                  textStyle: textStyle.headlineMedium!,
                  iconAsset: 'assets/images/contacts.png',
                  iconColor: colors.primary,
                  onTap: () => Modular.to.pushNamed("/clients/"),
                ),
                MainButton(
                  title: "Orçamento",
                  backgroundColor: colors.primary,
                  textStyle: textStyle.headlineMedium!,
                  iconAsset: 'assets/images/quote.png',
                  iconColor: const Color(0xff4F378B),
                  onTap: () => print("navidate to quote"),
                ),
              ],
            ),
      ),
    );
  }
}
