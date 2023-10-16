enum AddPasswordError {
  email,
  url,
  data,
  other;

  static AddPasswordError? getAddPasswordErrorFromString(String status) {
    for (var element in AddPasswordError.values) {
      if (element.toString() == status) {
        return element;
      }
    }
    return null;
  }
}
