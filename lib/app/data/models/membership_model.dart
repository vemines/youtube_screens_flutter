import '../../shared/utils/formatters/viewed.dart';

class MemberShipModel {
  MemberShipModel({
    required this.iconChannel,
    required this.nameChannel,
    required this.tagChannel,
    required this.perksEnd,
    required this.pricePerMonth,
  });
  final String iconChannel;
  final String nameChannel;
  final String tagChannel;
  final DateTime perksEnd;
  final double pricePerMonth;

  String getPerksEnd() {
    final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return "Access to perks end: ${months[perksEnd.month - 1]} ${perksEnd.day.toString()}";
  }

  String getPricePerMonth() => "đ${NumberFormatter.format(pricePerMonth.toInt())}/mo";
}
