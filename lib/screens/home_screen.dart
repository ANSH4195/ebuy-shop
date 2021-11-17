import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions { favorites, all }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _onlyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EBuy'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.favorites) {
                setState(() {
                  _onlyFav = true;
                });
              } else {
                setState(() {
                  _onlyFav = false;
                });
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Favorite Products'),
                value: FilterOptions.favorites,
              ),
              const PopupMenuItem(
                child: Text('All Products'),
                value: FilterOptions.all,
              ),
            ],
          )
        ],
      ),
      body: ProductsGrid(_onlyFav),
    );
  }
}
