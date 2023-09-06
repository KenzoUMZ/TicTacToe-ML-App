import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe_ml_app/app/infra/infra.dart';
import 'package:tictactoe_ml_app/app/presentation_layer/modules/home/cubit/home_cubit.dart';

import 'cubit/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    super.initState();
    _homeCubit = Modular.get<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (_, state) {
          return Scaffold(
            backgroundColor: AppColors.black,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text('Game Mode'),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text('ML Mode'),
                    ),
                  ),
                  InkWell(
                    onTap: () => Modular.to.pushNamed('/api_test'),
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Center(
                        child: Text('API Test Mode'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
