import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:login_sample_project/features/login/models/input_number.dart';
import 'package:login_sample_project/repository.dart/login_repostiory.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(const LoginState()) {
    on<LoginEvent>(
      (event, emit) {
        if (event is PhoneNumberChanged) {
          _onPhoneNumberChanged(event, emit);
        } else if (event is VerificationCodeRequested) {
          _onVerificationCodeRequested(event, emit);
        }
      },
    );
  }

  final LoginRepository _loginRepository;

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        phoneNumber: InputNumber.dirty(event.phoneNumber),
      ),
    );
  }

  void _onVerificationCodeRequested(
      VerificationCodeRequested event, Emitter<LoginState> emit) {
    if (state.phoneNumber.isValid) {
      emit(state.copyWith(phoneNumberStatus: FormzSubmissionStatus.inProgress));
      try {
        _loginRepository.fetchVericationCode(
          int.parse(
            state.phoneNumber.value,
          ),
        );
        emit(
          state.copyWith(phoneNumberStatus: FormzSubmissionStatus.success),
        );
      } catch (e) {
        emit(
          state.copyWith(phoneNumberStatus: FormzSubmissionStatus.failure),
        );
      }
    }
  }
}
