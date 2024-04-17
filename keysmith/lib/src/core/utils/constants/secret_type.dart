enum SecretType {
  password("password"),
  note("note");

  const SecretType(this.name);
  final String name;

  static SecretType? getSecretFromString(String secretTypeString) {
    if (secretTypeString.isEmpty) {
      return null;
    }
    switch (secretTypeString) {
      case "password":
        return SecretType.password;
      case "note":
        return SecretType.note;
      default:
        return null;
    }
  }

  static SecretType? getSecretFromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      return null;
    }
    return SecretType.getSecretFromString(map['secretType']);
  }
}
