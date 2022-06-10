import 'package:app_costura/app/app_module.dart';
import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ClientAdapter());
  await Hive.openBox("settings");
  await Hive.openBox("clients");
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Costura app',
      theme: FlexThemeData.light(
        scheme: FlexScheme.materialBaseline,
        onPrimaryContainer: const Color(0xFF21005D),
        useMaterial3: true,
      ),
      /* darkTheme: FlexThemeData.dark( */
      /*   scheme: FlexScheme.materialBaseline, */
      /*   useMaterial3: true, */
      /* ), */
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
