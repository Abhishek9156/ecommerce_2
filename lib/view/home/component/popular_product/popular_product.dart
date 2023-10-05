import 'package:ecom/model/product.dart';
import 'package:ecom/view/home/component/popular_product/popular_product_card.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  final List<Product> product;
  const PopularProduct( {super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: product.length,
          itemBuilder: (context, index) =>
             PopularProductCard(product: product[index])),
    );
  }
}

