import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/products/product_item.dart';

class ProductOverviewGrid extends StatelessWidget {
  const ProductOverviewGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductItem(
            products[i].id, products[i].title, products[i].imageUrl),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10));
  }
}
