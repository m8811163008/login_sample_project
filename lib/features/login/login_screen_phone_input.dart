import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_sample_project/features/login/bloc/login_bloc.dart';
import 'package:login_sample_project/features/login/models/input_number.dart';
import 'package:login_sample_project/repository.dart/login_repostiory.dart';

class LoginScreenPhoneInput extends StatelessWidget {
  const LoginScreenPhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        loginRepository: RepositoryProvider.of<LoginRepository>(context),
      ),
      child: LoginScreenView(),
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
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
            SizedBox(
              height: 16.0,
            ),
            OutlinedButton(
              onPressed: phoneNumberLength < 10
                  ? null
                  : () {
                      context.read<LoginBloc>().add(
                            VerificationCodeRequested(),
                          );
                    },
              child: Text('Get verification code'),
            )
          ],
        ),
      ),
    );
  }

  String? errorText(InputNumberError? displayError) => switch (displayError) {
        InputNumberError.empty => 'Empty',
        InputNumberError.minimumLength => 'Minimum length error',
        _ => null
      };
}
