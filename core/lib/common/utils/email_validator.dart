import 'package:core/common/error_type_mixin.dart';
import 'package:core/common/result.dart';

enum EmailValidatorErrorType with ErrorTypeEnumMixin {
  emailRequired,
  emailInvalid,
}

class EmailValidator {
  Result<Unit, EmailValidatorErrorType> isValidEmail(String email) {
    if (email.isEmpty) {
      return EmailValidatorErrorType.emailRequired.toFailure();
    } else {
      bool matches = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);
      if (matches) {
        return Success(Unit());
      } else {
        return EmailValidatorErrorType.emailInvalid.toFailure();
      }
    }
  }
}