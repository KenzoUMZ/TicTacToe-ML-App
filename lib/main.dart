import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';


import 'app/presentation_layer/presentation_layer.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
