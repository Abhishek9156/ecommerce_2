import 'package:ecom/controllers/auth_controller.dart';
import 'package:ecom/controllers/category_controller.dart';
import 'package:ecom/controllers/dashboard_controller.dart';
import 'package:ecom/controllers/home_controller.dart';
import 'package:ecom/controllers/product_controller.dart';
import 'package:get/get.dart';

class DashboardBinging extends Bindings{

  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.put(AuthController());


  }
}