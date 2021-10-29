import "package:flutter/material.dart";
import 'package:shop/screens/product_overview_gird.dart';

class ProductOverview extends StatelessWidget {
  const ProductOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MyShop")),
      body: const ProductOverviewGrid(),
    );
  }
}
