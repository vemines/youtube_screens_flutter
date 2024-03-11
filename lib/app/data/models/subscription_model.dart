class SubscriptionModel {
  SubscriptionModel({
    required this.iconChannel,
    required this.nameChannel,
    this.isSilent = false,
  });
  final String iconChannel;
  final String nameChannel;
  final bool isSilent;
}
