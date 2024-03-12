class SubscriptionModel {
  SubscriptionModel({
    required this.iconChannel,
    required this.nameChannel,
    this.status = SubStatus.All,
  });
  final String iconChannel;
  final String nameChannel;
  final SubStatus status;
}

enum SubStatus { All, Personalized, None }
