import 'package:ecommerce_app/Categorie%20Scren/tshirtdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class CategoryDetailPage extends StatelessWidget {
  final String categoryTitle;

  CategoryDetailPage(this.categoryTitle);

  
  final List<Map<String, String>> tShirtData = [
    {
      'image': 'android/images/assets/tshirt.png',
      'description': 'Minimalist Small Business T-Shirt',
      'price': '\$20.00',
      'reviews': '4.5'
    },
    {
     'image': 'android/images/assets/tshirt2.png',
      'description': 'Minimalist Small Business T-Shirt',
      'price': '\$20.00',
      'reviews': '3.0'
    },
    {
      'image': 'android/images/assets/tshirt3.png',
      'description': 'Minimalist Small Business T-Shirt',
      'price': '\$20.00',
      'reviews': '2.5'
    },
    {
      'image': 'android/images/assets/tshirt4.png',
      'description': 'Minimalist Small Business T-Shirt',
      'price': '\$20.00',
      'reviews': '4.5'
    },
    {
      'image': 'android/images/assets/tshirt5.png',
      'description': 'Minimalist Small Business T-Shirt',
      'price': '\$20.00',
      'reviews': '3.5'
    },
    {
      'image': 'android/images/assets/tshirt1.png',
      'description': 'Minimalist Small Business T-Shirt',
      'price': '\$20.00',
      'reviews': '4.5'
    },
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, 
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.6, 
        ),
        itemCount: tShirtData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TShirtDetailPage(
                    tShirtData[index]['image']!,
                    tShirtData[index]['description']!,
                    tShirtData[index]['price']!,
                    tShirtData[index]['reviews']!,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      tShirtData[index]['image']!,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tShirtData[index]['description']!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          tShirtData[index]['price']!,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        RatingBar.builder(
                          initialRating:
                              double.parse(tShirtData[index]['reviews']!),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            // handle rating update
                          },
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${tShirtData[index]['reviews']} reviews',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
