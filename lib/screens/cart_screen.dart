import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  CartScreen(this.cartItems);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void handlePaymentForAll() {
    // Proses pembayaran semua produk di keranjang
    setState(() {
    widget.cartItems.clear();
    });
  }

  void handlePaymentForOne() {
    // Proses pembayaran satu produk di keranjang
  }

  void handleRemoveFromCart(int index) {
    // Hapus produk dari keranjang berdasarkan indeks
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.network(
                  widget.cartItems[index].product.imageUrl,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(widget.cartItems[index].product.title),
                subtitle: Text('Harga: ${widget.cartItems[index].product.price}'),
                trailing: Text('Qty: ${widget.cartItems[index].quantity}'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      handleRemoveFromCart(index);
                    },
                    child: Text('Hapus dari Keranjang'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      handleRemoveFromCart(index);
                    },
                    child: Text('Bayar Satu Produk'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              handlePaymentForAll();
            },
            child: Text('Bayar Semua Produk'),
          ),
        ],
      ),
    );
  }
}
