// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VerificationCode {
  final String code;

  VerificationCode({required this.code});

  factory VerificationCode.fromMap(Map<String, dynamic> map) {
    return VerificationCode(
      code: _parseMessage(map['message'] as String),
    );
  }

  factory VerificationCode.fromJson(String source) =>
      VerificationCode.fromMap(json.decode(source) as Map<String, dynamic>);

  static String _parseMessage(String message) =>
      message.substring(message.length - 6, message.length);
}
