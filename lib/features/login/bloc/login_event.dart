// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PhoneNumberFocusChanged extends LoginEvent {}

final class PhoneNumberChanged extends LoginEvent {
  final String phoneNumber;

  PhoneNumberChanged({required this.phoneNumber});

  @override
  String toString() => 'PhoneNumberChanged(phoneNumber: $phoneNumber)';
}

final class VerificationCodeRequested extends LoginEvent {
  VerificationCodeRequested();
}

final class JsonWebTokenRequested extends LoginEvent {
  JsonWebTokenRequested();
}
