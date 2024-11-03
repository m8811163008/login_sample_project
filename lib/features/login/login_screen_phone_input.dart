import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:login_sample_project/features/component_library/input_view.dart';
import 'package:login_sample_project/features/login/bloc/login_bloc.dart';
import 'package:login_sample_project/features/login/login_screen_verify.dart';
import 'package:login_sample_project/features/login/models/input_number.dart';
import 'package:login_sample_project/repository.dart/login_repostiory.dart';

class LoginScreenPhoneInputRoute extends StatelessWidget {
  const LoginScreenPhoneInputRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        loginRepository: RepositoryProvider.of<LoginRepository>(context),
      ),
      child: const LoginScreenView(),
    );
  }
}

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    final displayError =
        context.select((LoginBloc bloc) => bloc.state.phoneNumber.displayError);
    final phoneNumberLength =
        context.select((LoginBloc bloc) => bloc.state.phoneNumber.value.length);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.phoneNumberStatus.isInProgressOrSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginScreenVerifyRoute(),
            ),
          );
        } else if (state.phoneNumberStatus.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Something went worng'),
              ),
            );
        }
      },
      child: InputView(
        textField: TextField(
          decoration: InputDecoration(
            labelText: 'Phone number',
            errorText: errorText(displayError),
            prefixText: '+',
          ),
          keyboardType: TextInputType.numberWithOptions(),
          inputFormatters: [
            LengthLimitingTextInputFormatter(12),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (phoneNumber) {
            loginBloc.add(
              PhoneNumberChanged(phoneNumber: phoneNumber),
            );
          },
        ),
        onPressed: phoneNumberLength < 10
            ? null
            : () {
                context.read<LoginBloc>().add(
                      VerificationCodeRequested(),
                    );
              },
        buttonLabel: 'Get verification code',
      ),
    );
  }

  String? errorText(InputNumberError? displayError) => switch (displayError) {
        InputNumberError.empty => 'Empty',
        InputNumberError.minimumLength => 'Minimum length error',
        _ => null
      };
}
