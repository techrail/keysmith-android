///Validates if the provided [email] is a valid email.
///
///For the email to be valid, following conditon are to be met:
///* Must contain '@'symbol.
///* Must have a domain name at the end.
///
bool isValidEmail({required String email}) {
  if (email.isEmpty) {
    return false;
  }
  const regex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  return RegExp(regex).hasMatch(email);
}
