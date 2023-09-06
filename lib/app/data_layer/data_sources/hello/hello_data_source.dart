import 'package:tictactoe_ml_app/app/infra/utils/extensions/future_extension.dart';

import '../../../infra/infra.dart';

class HelloDataSource {
  final Http _http;

  HelloDataSource({
    required Http http,
  }) : _http = http;

  Future<Result<void>> sayHello({
    required String name,
  }) async {
    return await _http.dio
        .get(
          '${AppEndpoints.hello}/$name',
        )
        .result((json) => json);
  }
}
