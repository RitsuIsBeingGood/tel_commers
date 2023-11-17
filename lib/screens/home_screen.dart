import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../screens/cart_screen.dart';

List<CartItem> cartItems = [];

void handleCartButtonPress(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CartScreen(cartItems)),
  );
}

class HomeScreen extends StatelessWidget {
  final BuildContext context;
  HomeScreen(this.context);
  final Widget logo = Image.asset(
    'assets/logo.jpg',
    width: 40,
    height: 40,
  );

  final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  void addToCart(Product product) {
    final CartItem newItem = CartItem(product: product, quantity: 1);
    cartItems.add(newItem);
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
  Product(
    id: '2',
    title: 'baju kece',
    price: 15000.0,
    imageUrl: 'assets/baju1.jpg',
  ),
  Product(
    id: '3',
    title: 'baju keren',
    price: 20000.0,
    imageUrl: 'assets/baju2.jpg',
  ),
  Product(
    id: '4',
    title: 'sunset shirt',
    price: 25000.0,
    imageUrl: 'assets/bajubest.jpg',
  ),
  Product(
    id: '5',
    title: 'baju tc',
    price: 18000.0,
    imageUrl: 'assets/baju4.jpg',
  ),
  Product(
    id: '6',
    title: 'baju orang pinter',
    price: 22000.0,
    imageUrl: 'assets/baju5.jpg',
  ),
  Product(
    id: '7',
    title: 'baju khas jawa',
    price: 80000.0,
    imageUrl: 'assets/Baju java.png',
  ),
  Product(
    id: '8',
    title: 'baju TELA',
    price: 75000.0,
    imageUrl: 'assets/Baju TELA.png',
  ),
];


    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: logo,
            ),
            Text('Tel-commerce'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Image.asset('assets/cart.png'),
              onPressed: () {
                handleCartButtonPress(context);
              },
              iconSize: 75.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Slider di tengah
          CarouselSlider(
            items: [
              'assets/BestSell.jpg',
              'assets/hotsale.jpg',
            ].map((item) {
              return Center(
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
            ),
          ),
          // Daftar produk di bawah slider
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return buildProductCard(products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            product.imageUrl,
            width: 150,
            height: 150,
          ),
          SizedBox(height: 10),
          Text(
            product.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Harga: ${currencyFormatter.format(product.price)}',
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
            onPressed: () {
              addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Produk telah dimasukkan dikeranjang'),
                duration: Duration(seconds: 2),
              ));
            },
            child: Text('Tambahkan ke Keranjang'),
          ),
        ],
      ),
    );
  }
}
