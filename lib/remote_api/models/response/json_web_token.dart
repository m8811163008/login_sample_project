// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JsonWebToken {
  final String accessToken;

  JsonWebToken({required this.accessToken});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
    };
  }

  factory JsonWebToken.fromMap(Map<String, dynamic> map) {
    return JsonWebToken(
      accessToken: map['accessToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JsonWebToken.fromJson(String source) =>
      JsonWebToken.fromMap(json.decode(source) as Map<String, dynamic>);
}
