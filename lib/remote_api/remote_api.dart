import 'package:login_sample_project/remote_api/models/requests/phone_number.dart';
import 'package:login_sample_project/remote_api/models/response/exception.dart';
import 'package:login_sample_project/remote_api/models/response/json_web_token.dart';
import 'package:http/http.dart' as http;
import 'package:login_sample_project/remote_api/models/response/verification_code.dart';

abstract class RemoteApi {
  factory RemoteApi() => RemoteApiImpl();

  Future<VerificationCode> fetchVericationCode(int phoneNumber);

  Future<JsonWebToken> fetchJsonWebToken(int vericationCode);
}

class RemoteApiImpl implements RemoteApi {
  RemoteApiImpl();

  @override
  Future<JsonWebToken> fetchJsonWebToken(int vericationCode) async {
    final response = await http.get(UrlAddress.fetchJsonWebTokenUri);
    if (response.statusCode != 200) throw ApiException();

    return JsonWebToken.fromJson(response.body);
  }

  @override
  Future<VerificationCode> fetchVericationCode(int phoneNumber) async {
    final body = PhoneNumberRequest(phoneNumber: phoneNumber).toJson();
    final response = await http.post(
      UrlAddress.fetchJsonWebTokenUri,
      body: body,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode != 200) throw ApiException();

    return VerificationCode.fromJson(response.body);
  }
}

class UrlAddress {
  static Uri fetchJsonWebTokenUri = Uri(
    scheme: 'https',
    host: 'api.persia.tickets',
    path: 'auth/api/v1/auth/code',
  );

  static Uri fetchVericationCodeUri = Uri(
    scheme: 'https',
    host: 'api.persia.tickets',
    path: 'auth/api/v1/auth/verify-code',
  );
}
