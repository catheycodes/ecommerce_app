
import 'package:ecommerce_app/PaymentScreen/CheckOutPage.dart';
import 'package:flutter/material.dart';

import '../Cart Screen/CartPage.dart';


class TShirtDetailPage extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String price;
  final String reviews;

  TShirtDetailPage(this.imageUrl, this.description, this.price, this.reviews);

  final List<String> similarProductImages = [
     'android/images/assets/tshirt2.png',
      'android/images/assets/tshirt3.png',
       'android/images/assets/tshirt4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Product Detail'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                price,
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                '₹194 with 2 Special Offers\nFree Delivery\n4⭐ ($reviews reviews)',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Select Size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['S', 'M', 'L', 'XL', 'XXL']
                    .map((size) => ChoiceChip(
                          label: Text(size),
                          selected: false,
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Similar Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: similarProductImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Image.network(
                    similarProductImages[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        CartPage.cartItems.add(CartItem(
                          imageUrl: imageUrl,
                          description: description,
                          price: price,
                          reviews: reviews,
                        ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('Add to Cart',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                              imageUrl: imageUrl,
                              description: description,
                              price: price,
                              reviews: reviews,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('Buy Now',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4C53A5), 
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
