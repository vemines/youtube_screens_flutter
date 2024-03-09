extension ConvertDouble on double {
  int opacityToAlpha() => (255 * this).ceil();
}

extension ConvertInt on int {
  String formatTime() {
    String duration = '${(Duration(seconds: this))}'.split('.')[0].padLeft(8, '0');
    return this > 3600 ? duration : duration.substring(3);
  }
}
