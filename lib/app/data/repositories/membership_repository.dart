import '../../../gen/assets.gen.dart';
import '../models/membership_model.dart';

class MembershipRepository {
  static List<MemberShipModel> mock = [
    MemberShipModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines',
      tagChannel: "@Vemines",
      perksEnd: DateTime.now().add(Duration(days: 10)),
      pricePerMonth: 30000,
    ),
    MemberShipModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines lorem ipsum',
      tagChannel: "@Vemines1",
      perksEnd: DateTime.now().add(Duration(days: 10)),
      pricePerMonth: 30000,
    ),
  ];
}
