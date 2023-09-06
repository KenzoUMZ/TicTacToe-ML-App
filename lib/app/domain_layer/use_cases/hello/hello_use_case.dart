// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../data_layer/data_sources/data_sources.dart';
import '../../../infra/infra.dart';

class HelloUseCase {
  final HelloDataSource _helloDataSource;

  HelloUseCase({
    required HelloDataSource helloDataSource,
  }) : _helloDataSource = helloDataSource;

  Future<Result<void>> call({
    required String username,
    required String name,
    required String email,
    required String password,
  }) async {
    return await _helloDataSource.sayHello(
      name: name,
    );
  }
}
