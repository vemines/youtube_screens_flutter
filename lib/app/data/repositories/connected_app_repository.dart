import '../../../gen/assets.gen.dart';
import '../models/connected_app.dart';

class ConnectedAppRepository {
  static List<ConnectedAppModel> mock = [
    ConnectedAppModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines',
    ),
    ConnectedAppModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines lorem ipsum',
      status: true,
    ),
    ConnectedAppModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 1',
      status: true,
    ),
    ConnectedAppModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 2',
      status: true,
    ),
    ConnectedAppModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 3',
    ),
    ConnectedAppModel(
      iconChannel: Assets.png.coffee.path,
      nameChannel: 'VeMines 4',
    ),
  ];
}
