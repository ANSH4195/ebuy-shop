import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFav;
  const ProductsGrid(this.showOnlyFav, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showOnlyFav ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, idx) {
        return ChangeNotifierProvider.value(
          value: products[idx],
          child: const ProductItem(),
        );
      },
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
