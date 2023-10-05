
import 'package:ecom/model/category.dart';
import 'package:ecom/services/remote_service/remote_product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  TextEditingController searchTextEditController=TextEditingController();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxString searchVal=''.obs;

  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getProducts();
  }

  getProducts() async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } catch (e) {
      isProductLoading(false);
      print("Product =$e");
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }

  void getProductByName({required String name}) async{
    try {
      isProductLoading(true);
      var result=await RemoteProductService().getByName(name: name);
      if(result!=null){
            productList.assignAll(productListFromJson(result.body));
          }
    } catch (e) {
      isProductLoading(false);
      print("Seach Error= $e");
    } finally {
      isProductLoading(false);
      print(productList.length);
    }


  }


  void getProductByCategory({required int id}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByCategory(id: id);
      if(result != null){
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }
}