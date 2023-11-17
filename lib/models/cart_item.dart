import 'product.dart'; // Sesuaikan dengan path ke file Product

class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}
class Cart {
  List<CartItem> items = [];

  // Metode untuk menghapus semua produk dari keranjang
  void clearCart() {
    items.clear();
  }
}
