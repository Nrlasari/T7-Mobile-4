import 'package:flutter/material.dart';
import 'package:p7_provider/cart_model.dart';
import 'package:p7_provider/cart_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TokoJajan',
      debugShowCheckedModeBanner: false,
      home: const ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const List<Product> products = [
    Product('Super Zuper'),
    Product('Chitato'),
    Product('Yupi'),
    Product('Indomie'),
    Product('Buavita'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoJajan'),
        backgroundColor: const Color.fromARGB(255, 103, 169, 82),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return Badge(
                  label: Text('${cart.totalItems}'),
                  isLabelVisible: cart.totalItems > 0,
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 2),
            child: ListTile(
              title: Text(product.nama),
              trailing: IconButton(
                icon: const Icon(Icons.shopping_cart_checkout),
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).add(product);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
