import 'package:get/get.dart';

import '../controllers/work_details_controller.dart';

class WorkDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkDetailsController>(
      () => WorkDetailsController(),
    );
  }
}
