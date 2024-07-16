import 'package:ecommerce_app/KidsClothingScreen.dart/kidsClothDetailsPage.dart';
import 'package:flutter/material.dart';

import 'CategoryDetailPage.dart';


class MensClothingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEN FASHION'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              
            ),
            Divider(),
            CategorySection(
              title: 'MEN FASHION',
              categories: [
                CategoryItem(
                  title: 'T Shirts',
                  imagePath: 'android/images/assets/tshirt.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailPage('T Shirts'),
                      ),
                    );
                  },
                ),
                CategoryItem(
                  title: 'Shirts',
                  imagePath: 'android/images/assets/shirt.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'Trousers',
                   imagePath: 'android/images/assets/trousers.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'Sports Wear',
                   imagePath: 'android/images/assets/sportswear.png',       
                              onTap: () {},
                ),
                CategoryItem(
                  title: 'Ethnic Wear',
                   imagePath: 'android/images/assets/ethnic wear.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'Inner Wear',
                 imagePath: 'android/images/assets/inner wear.png',
                  onTap: () {},
                ),
              ],
            ),
            CategorySection(
              title: 'MENS FOOTWEAR',
              categories: [
                CategoryItem(
                  title: 'Sports Shoes',
                   imagePath: 'android/images/assets/shoes.png',
                                     onTap: () {},
                ),
                CategoryItem(
                  title: 'Casual Shoes',
                   imagePath: 'android/images/assets/casual-shoes.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'Flip Flops',
                   imagePath: 'android/images/assets/flipflops.png',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<CategoryItem> categories;

  CategorySection({required this.title, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: categories[index].onTap,
              child: CategoryCard(category: categories[index]),
            );
          },
        ),
      ],
    );
  }
}

class CategoryItem {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  CategoryItem(
      {required this.title, required this.imagePath, required this.onTap});
}

class CategoryCard extends StatelessWidget {
  final CategoryItem category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.5),
            margin: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: category.imagePath.startsWith('http')
                  ? Image.network(
                      category.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Image.asset(
                      category.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          category.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

