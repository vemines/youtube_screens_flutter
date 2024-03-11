import '../models/subscription_model.dart';

import '../../../gen/assets.gen.dart';

class SubcriptionsRepository {
  static List<SubscriptionModel> mock = [
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines',
      isSilent: true,
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines lorem ipsum',
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 1',
      isSilent: true,
    ),
    SubscriptionModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 2',
      isSilent: true,
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
