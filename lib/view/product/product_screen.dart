 import 'package:ecom/component/main_header.dart';
import 'package:ecom/controllers/controllers.dart';
import 'package:ecom/view/product/component/product_loading_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'component/product_grid.dart';

class ProductScreen extends StatelessWidget {
   const ProductScreen({super.key});
 
   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Column(
         children: [
           const MainHeader(),
           Expanded(
               child: Obx((){
                 if(productController.isProductLoading.value){
                   return const ProductLoadingGrid();
                 } else {
                   if(productController.productList.isNotEmpty){
                     return ProductGrid(products: productController.productList);
                   } else {
                     return Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset('assets/product_not_found.png'),
                         const SizedBox(height: 10),
                         const Text('Products Not Found!')
                       ],
                     );
                   }
                 }
               })
           )
         ],
       ),
     );
   }
}