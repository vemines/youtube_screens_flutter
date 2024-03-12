class ConnectedAppModel {
  ConnectedAppModel({
    required this.iconChannel,
    required this.nameChannel,
    this.status = false,
  });
  final String iconChannel;
  final String nameChannel;
  final bool status;
}
