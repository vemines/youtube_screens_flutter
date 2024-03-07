class NumberFormatter {
  static String format(int currentBalance) {
    int value = currentBalance;
    try {
      List<String> suffixes = ['', 'K', 'M', 'B', 'T', 'P', 'E'];

      int order = 0;
      while (value >= 1000 && order < suffixes.length - 1) {
        value = (value / 1000).floor();
        order++;
      }

      return '${value.toStringAsFixed(currentBalance > 1000 ? 1 : 0)}${suffixes[order]}';
    } catch (e) {
      print(e);
      return "0"; // Return original value on error
    }
  }
}
