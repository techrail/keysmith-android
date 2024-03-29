enum PasswordStrengthCriteria {
  lowerCase("Lower case"),
  upperCase("Upper case"),
  numeric("Numbers"),
  special("Special Characters");

  const PasswordStrengthCriteria(this.name);
  final String name;

  static PasswordStrengthCriteria? getCriteriaFromString(
      String crieteriaString) {
    if (crieteriaString.isEmpty) {
      return null;
    }
    switch (crieteriaString) {
      case "Upper case":
        return PasswordStrengthCriteria.upperCase;
      case "Lower case":
        return PasswordStrengthCriteria.lowerCase;
      case "Numbers":
        return PasswordStrengthCriteria.numeric;
      case "Special Characters":
        return PasswordStrengthCriteria.special;
      default:
        return null;
    }
  }
}
