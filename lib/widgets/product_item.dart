import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman detail produk saat produk di tap
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailScreen(product)),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Image.network(product.imageUrl),
            Text(product.title),
            Text('\$${product.price}'),
            // Tambahkan lebih banyak elemen UI sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
