// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApiErrorModel {
  final String? message;
  final int? code;
  ApiErrorModel({
    this.message,
    this.code,
  });

  ApiErrorModel copyWith({
    String? message,
    int? code,
  }) {
    return ApiErrorModel(
      message: message ?? this.message,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'code': code,
    };
  }

  factory ApiErrorModel.fromMap(Map<String, dynamic> map) {
    return ApiErrorModel(
      message: map['message'] != null ? map['message'] as String : null,
      code: map['code'] != null ? map['code'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiErrorModel.fromJson(String source) =>
      ApiErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiErrorModel(message: $message, code: $code)';

  @override
  bool operator ==(covariant ApiErrorModel other) {
    if (identical(this, other)) return true;

    return other.message == message && other.code == code;
  }

  @override
  int get hashCode => message.hashCode ^ code.hashCode;
}
