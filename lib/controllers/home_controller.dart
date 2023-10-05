import 'package:ecom/model/add_banner.dart';
import 'package:ecom/model/category.dart';
import 'package:ecom/model/product.dart';
import 'package:ecom/services/remote_service/remote_banner_service.dart';
import 'package:ecom/services/remote_service/remote_popular_category_service.dart';
import 'package:ecom/services/remote_service/remote_popular_product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  static HomeController instance = Get.find();
  RxList<AddBanner> bannerList = List<AddBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList = List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;



  @override
  void onInit() {
    getBanner();
    getPopularCategories();
    getPopularProduct();
  }

  void getBanner() async {
    try {
      isBannerLoading(true);
      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(addBannerListFromJson(result.body));
      }
    } catch(e) {
      print('Banner= $e.toString()');
    }
      finally {
      print(bannerList.length);
      isBannerLoading(false);
    }
  }




  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
      }
    }  catch(e) {
      print('cate= $e.toString()');
    }finally {
      print(popularCategoryList.length);
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);
      var result = await RemotePopularProductService().get();
      if (result != null) {
        popularProductList.assignAll(popularProductListFromJson(result.body));
      }
    } catch(e) {
      print('prod= $e.toString()');
    } finally {
      print(popularProductList.length);
      isPopularProductLoading(false);
    }
  }
}
