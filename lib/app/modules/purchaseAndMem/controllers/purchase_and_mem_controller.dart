import 'package:get/get.dart';
import '../../../data/repositories/membership_repository.dart';

import '../../../data/models/membership_model.dart';

class PurchaseAndMemController extends GetxController {
  final RxBool isLoading = true.obs;
  RxList<MemberShipModel> memberships = <MemberShipModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1)).then((_) {
      isLoading.value = false;
      memberships.value = MembershipRepository.mock;
    });
  }

  MemberShipModel membership = MembershipRepository.mock.first;
  void changeMemberShip(MemberShipModel value) {
    membership = value;
  }
}
