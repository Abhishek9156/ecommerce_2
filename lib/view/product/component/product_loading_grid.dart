import 'package:ecom/view/product/component/product_loading_card.dart';
import 'package:flutter/cupertino.dart';

class ProductLoadingGrid extends StatelessWidget {
  const ProductLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: 7,
      itemBuilder: (context, index) => const ProductLoadingCard(),
    );
  }
}