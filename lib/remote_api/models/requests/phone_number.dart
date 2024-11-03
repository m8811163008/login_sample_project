import 'dart:convert';

class PhoneNumberRequest {
  final int phoneNumber;

  PhoneNumberRequest({required this.phoneNumber});

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
        }
      };

  String toJson() => jsonEncode(toMap());
}
