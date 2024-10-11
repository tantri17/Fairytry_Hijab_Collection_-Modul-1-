import 'package:get/get.dart';

import '../controllers/roomdetail_controller.dart';

class RoomdetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomdetailController>(
      () => RoomdetailController(),
    );
  }
}
