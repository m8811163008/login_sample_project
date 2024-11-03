import 'dart:convert';

class PhoneNumberRequest {
  final int phoneNumber;
  final int? verificationCode;

  PhoneNumberRequest({required this.phoneNumber, this.verificationCode});

  Map<String, dynamic> toMap() => {
        'contact_info': '+$phoneNumber',
        'contact_type': 'phone',
        'device': {
          "device_name": "masood",
          "fcm_token": "string",
          "os_version": "1.0.0",
          "device_model": "iphone",
          "app_version": "2.0.0",
          "is_active": true,
          "notifications_enabled": true
        },
        if (verificationCode != null) 'code': verificationCode,
      };

  String toJson() => jsonEncode(toMap());
}
