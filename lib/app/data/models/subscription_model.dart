class SubscriptionModel {
  SubscriptionModel({
    required this.iconChannel,
    required this.nameChannel,
    required this.tagChannel,
    this.status = SubStatus.All,
  });
  final String iconChannel;
  final String nameChannel;
  final String tagChannel;
  final SubStatus status;
}

enum SubStatus { All, Personalized, None }
