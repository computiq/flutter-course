import 'package:get/get.dart';
import 'controller.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
