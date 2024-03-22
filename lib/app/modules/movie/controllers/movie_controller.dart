import 'package:get/get.dart';

class MovieController extends GetxController {
  RxList<Object> listVideos = <Object>[].obs;
  RxList<Object> listShorts = <Object>[].obs;
  RxList<Object> listLives = <Object>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadVideos();
  }

  void loadVideos() {
    currentState.value = CurrentState.LOADING;
    Future.delayed(Duration(seconds: 1)).then((_) {
      currentState.value = CurrentState.VIDEOS;
    });
  }

  void loadShorts() {
    currentState.value = CurrentState.LOADING;
    Future.delayed(Duration(seconds: 1)).then((_) {
      currentState.value = CurrentState.SHORTS;
      listShorts.value = List.generate(20, (index) => index);
    });
  }

  void loadLives() {
    currentState.value = CurrentState.LOADING;
    Future.delayed(Duration(seconds: 1)).then((_) {
      currentState.value = CurrentState.LIVES;
      listLives.value = List.generate(20, (index) => index + 100);
    });
  }

  Rx<CurrentState> currentState = CurrentState.LOADING.obs;
}

enum CurrentState {
  LOADING,
  VIDEOS,
  SHORTS,
  LIVES,
}
