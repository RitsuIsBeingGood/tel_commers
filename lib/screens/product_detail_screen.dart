import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 20),
            Text(
              'Price: \$${product.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'baju elit.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementasi tambah ke keranjang di sini
                  // Anda dapat menambahkan logika untuk memasukkan produk ke keranjang
                  addToCart(context, product);
                },
                child: Text('Masukkan ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menambahkan produk ke keranjang
  void addToCart(BuildContext context, Product product) {
    // Implementasikan logika untuk menambahkan produk ke keranjang di sini
    // Misalnya, Anda dapat menggunakan provider untuk mengelola keranjang belanja
    // Contoh: cartProvider.addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Produk ditambahkan ke keranjang.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
