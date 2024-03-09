extension ConvertDouble on double {
  int opacityToAlpha() => (255 * this).ceil();
}

extension ConvertInt on int {
  String formatTime() {
    String duration = '${(Duration(seconds: this))}'.split('.')[0].padLeft(8, '0');
    return this > 3600 ? duration : duration.substring(3);
  }

  String minutesToHHMM() {
    int hours = this ~/ 60;
    int minutes = this % 60;
    return hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m';
  }

  String toDayOfWeek() {
    switch (this) {
      case 0:
        return 'Mon';
      case 1:
        return 'Tue';
      case 2:
        return 'Wed';
      case 3:
        return 'Thu';
      case 4:
        return 'Fri';
      case 5:
        return 'Sat';
      case 6:
        return 'Sun';
      default:
        return '';
    }
  }
}
