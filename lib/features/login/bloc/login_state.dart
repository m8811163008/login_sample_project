part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final InputNumber phoneNumber;
  final InputNumber verificationNumber;
  final FormzSubmissionStatus phoneNumberStatus;
  final FormzSubmissionStatus phoneNumberVerificationNumber;

  const LoginState({
    this.phoneNumber = const InputNumber.pure(''),
    this.verificationNumber = const InputNumber.pure(''),
    this.phoneNumberStatus = FormzSubmissionStatus.initial,
    this.phoneNumberVerificationNumber = FormzSubmissionStatus.initial,
  });

  LoginState copyWith({
    InputNumber? phoneNumber,
    InputNumber? verificationNumber,
    FormzSubmissionStatus? phoneNumberStatus,
    FormzSubmissionStatus? phoneNumberVerificationNumber,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationNumber: verificationNumber ?? this.verificationNumber,
      phoneNumberStatus: phoneNumberStatus ?? this.phoneNumberStatus,
      phoneNumberVerificationNumber:
          phoneNumberVerificationNumber ?? this.phoneNumberVerificationNumber,
    );
  }

  @override
  List<Object> get props => [
        phoneNumber,
        verificationNumber,
        phoneNumberStatus,
        phoneNumberVerificationNumber,
      ];
}
