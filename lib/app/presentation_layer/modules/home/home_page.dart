import 'package:flutter/material.dart';
import 'package:tictactoe_ml_app/app/infra/infra.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
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
          ],
        ),
      ),
    );
  }
}
