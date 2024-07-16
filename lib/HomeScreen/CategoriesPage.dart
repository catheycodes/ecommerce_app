import 'package:ecommerce_app/Categorie%20Scren/menClothingPage.dart';
import 'package:ecommerce_app/KidsClothingScreen.dart/KidsClothPage.dart';
import 'package:flutter/material.dart';


class Categories extends StatelessWidget {
  final List<Category> categories = [
    Category(
      name: 'Mens Clothing',
      imageUrl: "android/assets/images/boys.png"
    ),
    Category(
      name: 'Mens Accessories',
      imageUrl:"android/assets/images/casual shoes.png"
    ),
    
    Category(
      name: 'Kids',
      imageUrl:"android/assets/images/frocks.png"
    ),
    
    Category(
      name: 'Baby Products',
      imageUrl:"android/assets/images/baby bedding.png"
    
    ),
  ];

  Categories({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return GestureDetector(
            onTap: () {
              if (category.name == 'Mens Clothing') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MensClothingPage()),
                );
              }
              if (category.name == 'Kids') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KidsClothingPage()),
                );
              }
              // Add similar logic for other categories as needed
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        backgroundImage: NetworkImage(category.imageUrl),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4C53A5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});
}
