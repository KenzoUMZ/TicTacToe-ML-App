import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends WidgetModule {
  HomeModule({super.key});

  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => const HomePage();
}
