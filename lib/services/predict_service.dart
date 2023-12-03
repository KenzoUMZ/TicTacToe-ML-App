import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tictactoe_ml_app/model/features_request_entity.dart';
import 'package:tictactoe_ml_app/model/features_response_entity.dart';

Future<FeaturesResponseEntity> predictService({
  required FeaturesRequestEntity requestEntity,
}) async {
  const String apiUrl = 'http://10.0.2.2:8000/predict';
  final Map<String, dynamic> data = {
    "features": requestEntity.features,
  };

  final http.Response response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    // Request was successful
    return FeaturesResponseEntity.fromJson(jsonDecode(response.body));
  } else {
    // Request failed

    throw Exception(
        'Failed to send request. Status code: ${response.statusCode}');
  }
}
