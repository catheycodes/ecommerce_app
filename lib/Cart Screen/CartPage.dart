import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return _buildCartItem(context, cartItems[index]);
        },
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item) {
    return Card(
      child: ListTile(
        leading: Image.network(
          item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(item.description),
        subtitle: Text('Price: ${item.price}\nReviews: ${item.reviews}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Implement delete functionality here
            cartItems.remove(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Item removed from cart'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartItem {
  final String imageUrl;
  final String description;
  final String price;
  final String reviews;

  CartItem({
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.reviews,
  });
}
