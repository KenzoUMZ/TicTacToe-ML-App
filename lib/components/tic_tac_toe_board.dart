import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe_ml_app/model/features_request_entity.dart';

class TicTacToeBoard extends StatefulWidget {
  final void Function(List<int> predictionList) setPredictionList;

  const TicTacToeBoard({
    super.key,
    required this.setPredictionList,
  });

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  late List<int> _predictionList;
  late FeaturesRequestEntity _featuresRequestEntity;

  @override
  void initState() {
    super.initState();

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

  void setPrediction({required int index, required int value}) {
    setState(() {
      _predictionList[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OptionItem(
              value: _predictionList[0],
              onPressed: (int value) {
                setPrediction(index: 0, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
            OptionItem(
              value: _predictionList[1],
              onPressed: (int value) {
                setPrediction(index: 1, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
            OptionItem(
              value: _predictionList[2],
              onPressed: (int value) {
                setPrediction(index: 2, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
          ],
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OptionItem(
              value: _predictionList[3],
              onPressed: (int value) {
                setPrediction(index: 3, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
            OptionItem(
              value: _predictionList[4],
              onPressed: (int value) {
                setPrediction(index: 4, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
            OptionItem(
              value: _predictionList[5],
              onPressed: (int value) {
                setPrediction(index: 5, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
          ],
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OptionItem(
              value: _predictionList[6],
              onPressed: (int value) {
                setPrediction(index: 6, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
            OptionItem(
              value: _predictionList[7],
              onPressed: (int value) {
                setPrediction(index: 7, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
            OptionItem(
              value: _predictionList[8],
              onPressed: (int value) {
                setPrediction(index: 8, value: value);
                widget.setPredictionList(_predictionList);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class OptionItem extends StatefulWidget {
  const OptionItem({
    super.key,
    required this.value,
    required this.onPressed,
  });
  final int value;
  final void Function(int value) onPressed;

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  late int value;
  late String currentOption = '';
  late int _elevation;
  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  void setValue(int value) {
    switch (value) {
      case -1:
        setState(() {
          this.value = -1;
        });
        break;
      case 1:
        setState(() {
          this.value = 1;
        });
        break;
      default:
        setState(() {
          this.value = 0;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 23, 12, 73),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          elevation: 2,
        ),
        onPressed: () {
          if (value == -1) {
            setValue(1);
          } else if (value == 1) {
            setValue(0);
          } else {
            setValue(-1);
          }

          widget.onPressed(value);
        },
        child: Center(
          child: Text(
            getOption(widget.value),
            style: GoogleFonts.russoOne(
              color: getOption(widget.value) == 'O'
                  ? Colors.blue
                  : getOption(widget.value) == 'X'
                      ? Colors.red
                      : Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

String getOption(int value) {
  if (value == -1) {
    return 'O';
  } else if (value == 1) {
    return 'X';
  } else {
    return '';
  }
}
