import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data_layer/data_layer.dart';
import '../../domain_layer/domain_layer.dart';
import '../infra.dart';
import 'base/base_http.dart';

abstract class NetworkModule {
  static List<Bind> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => GetAuthUseCase(shared: i())),
        Bind.lazySingleton((i) => Http(
              getAuthUseCase: i(),
            )),

        Bind.lazySingleton((i) => SharedHelper()),
        Bind.lazySingleton((i) => BaseHttp(getAuthUseCase: i())),
      ];
}
