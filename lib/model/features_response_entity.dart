// To parse this JSON data, do
//
//     final featuresResponseEntity = featuresResponseEntityFromJson(jsonString);

import 'dart:convert';

FeaturesResponseEntity featuresResponseEntityFromJson(String str) =>
    FeaturesResponseEntity.fromJson(json.decode(str));

String featuresResponseEntityToJson(FeaturesResponseEntity data) =>
    json.encode(data.toJson());

class FeaturesResponseEntity {
  final String prediction;

  FeaturesResponseEntity({
    required this.prediction,
  });

  FeaturesResponseEntity copyWith({
    String? prediction,
  }) =>
      FeaturesResponseEntity(
        prediction: prediction ?? this.prediction,
      );

  factory FeaturesResponseEntity.fromJson(Map<String, dynamic> json) =>
      FeaturesResponseEntity(
        prediction: json["prediction"],
      );

  Map<String, dynamic> toJson() => {
        "prediction": prediction,
      };
}
