import 'package:get/get.dart';

import '../controllers/checkoutpengajuan_controller.dart';

class CheckoutpengajuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutpengajuanController>(
      () => CheckoutpengajuanController(),
    );
  }
}
