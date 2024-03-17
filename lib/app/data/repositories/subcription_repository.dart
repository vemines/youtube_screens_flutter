import '../../../gen/assets.gen.dart';
import '../models/subscription_model.dart';

class SubcriptionRepository {
  static List<SubscriptionModel> mock = [
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines',
      tagChannel: "@Vemines",
      status: SubStatus.All,
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines lorem ipsum',
      status: SubStatus.None,
      tagChannel: "@Vemines1",
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 1',
      tagChannel: "@Vemines1",
      status: SubStatus.Personalized,
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      tagChannel: "@Vemines2",
      nameChannel: 'VeMines 2',
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      tagChannel: "@Vemines1234",
      nameChannel: 'VeMines 3',
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      tagChannel: "@Vemines9",
      nameChannel: 'VeMines 4',
    ),
  ];
}
