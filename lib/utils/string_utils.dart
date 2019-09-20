class StringUtils {
  static bool isEmpty(String text) {
    return text == null || text.length == 0;
  }

  static bool isNotEmpty(String text) {
    return text != null && text.length > 0;
  }
}