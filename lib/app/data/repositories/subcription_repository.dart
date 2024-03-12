import '../models/subscription_model.dart';

import '../../../gen/assets.gen.dart';

class SubcriptionRepository {
  static List<SubscriptionModel> mock = [
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines',
      status: SubStatus.All,
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines lorem ipsum',
      status: SubStatus.None,
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 1',
      status: SubStatus.Personalized,
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 2',
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 3',
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 4',
    ),
  ];
}
