import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  const InputView(
      {super.key,
      required this.textField,
      this.buttonLabel = '',
      required this.onPressed});
  final TextField textField;
  final VoidCallback? onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField,
            const SizedBox(
              height: 16.0,
            ),
            OutlinedButton(
              onPressed: onPressed,
              child: Text(buttonLabel),
            )
          ],
        ),
      ),
    );
  }
}
