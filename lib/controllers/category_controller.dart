import 'package:ecom/model/category.dart';
import 'package:ecom/services/remote_service/remote_category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController instance=Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() {
    getCategorys();
  }

  getCategorys() async {
    try {
      isCategoryLoading(true);
      var result = await RemoteCategoryServie().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
      }
    } catch (e) {
      isCategoryLoading(false);
      print("catego =$e");
    } finally {
      isCategoryLoading(false);
      print(categoryList.length);
    }
  }

}