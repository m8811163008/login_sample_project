import 'package:formz/formz.dart';

class InputNumber extends FormzInput<String, InputNumberError> {
  const InputNumber.pure(super.value) : super.pure();
  const InputNumber.dirty(super.value) : super.dirty();

  @override
  InputNumberError? validator(String value) {
    if (value.isEmpty) {
      return InputNumberError.empty;
    } else if (int.tryParse(value) == null) {
      return InputNumberError.isNotNumber;
    } else if (value.length < 10) {
      return InputNumberError.minimumLength;
    } else {
      return null;
    }
  }
}

enum InputNumberError { empty, isNotNumber, minimumLength }
