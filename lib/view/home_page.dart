import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe_ml_app/components/tic_tac_toe_board.dart';
import 'package:tictactoe_ml_app/model/features_response_entity.dart';

import '../model/features_request_entity.dart';
import '../services/predict_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<int> _predictionList;
  late FeaturesRequestEntity _featuresRequestEntity;
  late FeaturesResponseEntity _featuresResponseEntity;
  late String _response = '';
  late bool textChanged = false;
  late String previousOption = '';
  @override
  void initState() {
    super.initState();
    _featuresResponseEntity = FeaturesResponseEntity(prediction: '');
    _predictionList = [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
    ];
  }

  void getPredictionList(List<int> predictionList) {
    setState(() {
      _predictionList = predictionList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 28, 86),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tic-tac-toe',
              style: GoogleFonts.montserrat(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const Gap(60),
            Visibility(
              visible: textChanged,
              replacement: const Gap(30),
              child: SizedBox(
                height: 30,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      _response,
                      textStyle: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: _response.toLowerCase() == 'x wins'
                            ? const Color.fromARGB(255, 112, 250, 117)
                            : Colors.red,
                      ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 1,
                  // pause: const Duration(minutes: 1),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TicTacToeBoard(
              setPredictionList: (predictionList) =>
                  getPredictionList(predictionList),
            ),
            const Gap(50),
            SizedBox(
              // height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 23, 12, 73),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    _featuresRequestEntity =
                        FeaturesRequestEntity(features: _predictionList);

                    _featuresResponseEntity = await predictService(
                        requestEntity: _featuresRequestEntity);

                    _response = parseResponse(
                        featuresResponseEntity: _featuresResponseEntity);

                    //reanimate te
                    if (previousOption == _response) {
                      setState(() {
                        textChanged = false;
                      });
                    } else {
                      setState(() {
                        textChanged = true;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Text(
                      'PREDICT',
                      style: GoogleFonts.montserrat(fontSize: 20),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

String parseResponse({required FeaturesResponseEntity featuresResponseEntity}) {
  print('parseResponse: ${featuresResponseEntity.prediction}');
  if (featuresResponseEntity.prediction == 'sim') {
    return 'X WINS';
  } else if (featuresResponseEntity.prediction == 'nao') {
    return 'X DID NOT WIN';
  } else {
    return '';
  }
}
