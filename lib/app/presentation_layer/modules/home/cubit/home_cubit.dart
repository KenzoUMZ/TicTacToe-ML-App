import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }
}
