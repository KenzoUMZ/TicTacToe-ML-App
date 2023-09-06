import '../../domain_layer/domain_layer.dart';
import 'base/base_http.dart';

class Http extends BaseHttp {
  Http({
    required GetAuthUseCase getAuthUseCase,
  }) : super(
          getAuthUseCase: getAuthUseCase,
        );
}
