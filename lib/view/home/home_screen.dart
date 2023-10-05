import 'package:ecom/model/product.dart';
import 'package:ecom/view/home/component/carousel_slider/carousel_loading.dart';
import 'package:ecom/view/home/component/carousel_slider/carousel_slider_view.dart';
import 'package:ecom/view/home/component/popular_category/popular_category.dart';
import 'package:ecom/view/home/component/popular_category/popular_category_loading.dart';
import 'package:ecom/view/home/component/popular_product/popular_product_loading.dart';
import 'package:ecom/view/home/component/section_title/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ecom/controllers/controllers.dart';
import '../../component/main_header.dart';
import 'component/popular_product/popular_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            const MainHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [

                    //Slider top
                    Obx(() {
                      if (homeController.bannerList.isNotEmpty) {
                        return CarouselSliderView(bannerList: homeController.bannerList);
                      } else {
                        return const CarouselLoading();
                      }
                    }),

                    //Popular Category
                    const SectionTitle(title: "Popular Category"),
                    Obx(() {
                      if (homeController.popularCategoryList.isNotEmpty) {
                        return PopularCategory(
                            categories: homeController.popularCategoryList
                        );
                      } else {
                        return const PopulatCategoryLoading();
                      }
                    }),

                    //Popular Product
                    const SectionTitle(title: "Popular Product"),
                    Obx(() {
                      if (homeController.popularProductList.isNotEmpty) {
                        return PopularProduct(product:homeController.popularProductList);
                      } else {
                        return const PopularProductLoading();
                      }
                    }),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}