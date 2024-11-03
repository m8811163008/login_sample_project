import 'package:login_sample_project/remote_api/models/response/json_web_token.dart';
import 'package:login_sample_project/remote_api/models/response/verification_code.dart';
import 'package:login_sample_project/remote_api/remote_api.dart';

class LoginRepository {
  LoginRepository({required this.remoteApi});

  final RemoteApi remoteApi;

  Future<VerificationCode> fetchVericationCode(int phoneNumber) =>
      remoteApi.fetchVericationCode(phoneNumber);

  Future<JsonWebToken> fetchJsonWebToken(int vericationCode, int phoneNumber) =>
      remoteApi.fetchJsonWebToken(
        verificationCode: vericationCode,
        phoneNumber: phoneNumber,
      );
}
