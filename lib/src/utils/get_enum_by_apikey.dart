T? getEnumByApiKey<T>(List<T> values, String value) {
  try {
    return values.singleWhere((v) => (v as dynamic).apiKey == value);
  } catch (_) {
    return null;
  }
}

List<T> getMultipleEnumValuesByApiKey<T>(
  List<T> values,
  List<String> stringValues,
) {
  try {
    return values
        .where((v) => stringValues.any((s) => s == (v as dynamic).apiKey))
        .toList();
  } catch (_) {
    return [];
  }
}
