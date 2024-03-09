import 'package:get/get.dart';

class TimeWatchedController extends GetxController {
  RxInt maxHour = 12.obs;
  RxList<double> watchMinute = <double>[0, 0, 0, 0, 0, 0, 0].obs;
  void loadWatchMinute() {
    watchMinute.value = [123, 244, 314, 90, 188, 400, 200];
  }

  RxInt todayWatch = 188.obs;
  int last7Days() => watchMinute.reduce((a, b) => a + b).toInt();

  RxBool remindBreak = false.obs;
  RxBool remindBed = false.obs;
  RxBool autoPlayMobileAndTablet = false.obs;

  void changeRemindBreak(bool value) => remindBreak.value = value;
  void changeRemindBed(bool value) => remindBed.value = value;
  void changeAutoPlay(bool value) => autoPlayMobileAndTablet.value = value;
}
