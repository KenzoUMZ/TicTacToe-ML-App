// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiResponse {
  ApiResponse({
    this.data,
    this.list,
    this.errors,
  });

  final Map<String, dynamic>? data;
  final List<dynamic>? list;
  final ErrorResponse? errors;

  factory ApiResponse.fromJson(dynamic json) {
    if (json is List) {
      return ApiResponse(
        list: json,
      );
    } else if (json is Map) {
      return ApiResponse(
        data: Map<String, dynamic>.from(json),
        errors: json['detail'] != null && json['detail'] is Map
            ? ErrorResponse.fromJson(json['detail'] as Map<String, dynamic>)
            : null,
      );
    } else {
      return ApiResponse(data: {});
    }
  }
}

class ErrorResponse {
  final String? message;
  final String? code;

  ErrorResponse({
    required this.message,
    required this.code,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'],
      code: json['code'] ?? '',
    );
  }
}
