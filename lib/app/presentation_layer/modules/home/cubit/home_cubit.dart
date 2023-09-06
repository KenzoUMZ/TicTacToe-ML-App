import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe_ml_app/app/domain_layer/use_cases/hello/hello_use_case.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.helloUseCase,
  }) : super(const HomeState());

  final HelloUseCase helloUseCase;

  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void callHelloUseCase({
    required String username,
    required String name,
    required String email,
    required String password,
  }) async {
    setLoading(true);
    (await helloUseCase.call(
      username: username,
      name: name,
      email: email,
      password: password,
    ))
        .result(
      (data) => setLoading(false),
      (error) => null,
    );
  }
}
