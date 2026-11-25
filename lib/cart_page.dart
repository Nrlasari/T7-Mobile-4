import 'package:flutter/material.dart';
import 'package:p7_provider/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(child: Text('Keranjang Kosong'));
          }
          return ListView.builder(
            itemCount: cart.totalItems,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return ListTile(
                title: Text(item.nama),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  tooltip: 'Hapus',
                  onPressed: () {
                    context.read<CartModel>().removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.nama} dihapus')),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
