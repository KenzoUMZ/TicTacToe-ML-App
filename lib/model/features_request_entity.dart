// To parse this JSON data, do
//
//     final featuresRequestEntity = featuresRequestEntityFromJson(jsonString);

import 'dart:convert';

FeaturesRequestEntity featuresRequestEntityFromJson(String str) =>
    FeaturesRequestEntity.fromJson(json.decode(str));

String featuresRequestEntityToJson(FeaturesRequestEntity data) =>
    json.encode(data.toJson());

class FeaturesRequestEntity {
  final List<int> features;

  FeaturesRequestEntity({
    required this.features,
  });

  FeaturesRequestEntity copyWith({
    List<int>? features,
  }) =>
      FeaturesRequestEntity(
        features: features ?? this.features,
      );

  factory FeaturesRequestEntity.fromJson(Map<String, dynamic> json) =>
      FeaturesRequestEntity(
        features: List<int>.from(json["features"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "features": List<dynamic>.from(features.map((x) => x)),
      };
}
