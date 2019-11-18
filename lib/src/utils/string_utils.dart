class StringUtils {
  static String replaceWithValues(String string, Map<String, String> valueMap) {
    return string.replaceAllMapped(RegExp("(:[a-zA-Z0-9_]+)"), (Match match) {
      if (match.groupCount <= 0) {
        return '';
      }
      String key = match.group(0).substring(1);
      String value = valueMap[key];
      ArgumentError.checkNotNull(value, key);
      return value;
    });
  }
}
