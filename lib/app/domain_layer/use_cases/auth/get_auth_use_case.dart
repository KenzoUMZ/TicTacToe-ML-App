import '../../../data_layer/data_layer.dart';
import '../../domain_layer.dart';

class GetAuthUseCase {
  final SharedPreferences _shared;

  GetAuthUseCase({
    required SharedPreferences shared,
  }) : _shared = shared;

  Future<LoginResponseEntity?> call() async {
    var json = await _shared.getStorageData(SharedKeys.auth);

    if (json != null) {
      return LoginResponseEntity.fromJson(json);
    }
    return null;
  }
}
