extension StringCapitalization on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

extension EnumListToStringList on List<Enum> {
  List<String> toStringList() {
    return map((enumValue) => enumValue.name.capitalizeFirstLetter()).toList();
  }
}