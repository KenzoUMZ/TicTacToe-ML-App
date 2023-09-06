import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe_ml_app/app/infra/network/network_module.dart';
import 'package:tictactoe_ml_app/app/presentation_layer/modules/home/home_module.dart';

import '../infra/infra.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...NetworkModule.binds,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      AppRoutes.home,
      child: (_, __) => HomeModule(),
    ),
  ];
}
