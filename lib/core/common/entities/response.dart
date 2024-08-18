// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HostResponse {
  final String response;
  HostResponse({
    required this.response,
  });

  HostResponse copyWith({
    String? response,
  }) {
    return HostResponse(
      response: response ?? this.response,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'response': response,
    };
  }

  factory HostResponse.fromMap(Map<String, dynamic> map) {
    return HostResponse(
      response: map['response'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HostResponse.fromJson(String source) =>
      HostResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HostResponse(response: $response)';

  @override
  bool operator ==(covariant HostResponse other) {
    if (identical(this, other)) return true;

    return other.response == response;
  }

  @override
  int get hashCode => response.hashCode;
}
