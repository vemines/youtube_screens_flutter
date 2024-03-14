import 'package:get/get.dart';

import '../../../data/models/subscription_model.dart';
import '../../../data/repositories/subcription_repository.dart';

class AllSubscriptionsController extends GetxController {
  final RxBool isLoading = true.obs;

  RxList<SubscriptionModel> subscriptions = <SubscriptionModel>[].obs;
  Future<void> loadPosts() async {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      subscriptions.value = SubcriptionRepository.mock;
      isLoading.value = false;
    });
  }

  RxString currentSortOption = "Most relevant".obs;
  List<String> dropdownSortOptions = ["Most relevant", "New activity", "A-Z"];
  void changeSortOption(String s) {
    if (dropdownSortOptions.contains(s)) currentSortOption.value = s;
  }
}
