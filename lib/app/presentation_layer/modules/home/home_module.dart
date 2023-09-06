import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe_ml_app/app/presentation_layer/modules/home/cubit/home_cubit.dart';
import '../../../data_layer/data_sources/hello/hello_data_source.dart';
import '../../../domain_layer/use_cases/hello/hello_use_case.dart';
import 'home_page.dart';

class HomeModule extends WidgetModule {
  HomeModule({super.key});

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => HelloDataSource(http: i())),
        Bind.lazySingleton((i) => HelloUseCase(helloDataSource: i())),
        Bind.lazySingleton((i) => HomeCubit(helloUseCase: i()))
      ];

  @override
  Widget get view => const HomePage();
}
