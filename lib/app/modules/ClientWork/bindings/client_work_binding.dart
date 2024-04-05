import 'package:get/get.dart';

import '../controllers/client_work_controller.dart';

class ClientWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientWorkController>(
      () => ClientWorkController(),
    );
  }
}
