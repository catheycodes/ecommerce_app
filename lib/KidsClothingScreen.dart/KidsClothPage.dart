import 'package:ecommerce_app/KidsClothingScreen.dart/kidsClothDetailsPage.dart';
import 'package:flutter/material.dart';

import '../Categorie Scren/CategoryDetailPage.dart';


class KidsClothingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KIDS FASHION'),
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
              title: 'KIDS FASHION',
              categories: [
                CategoryItem(
                  title: 'Boys',
                  imagePath: 'android/images/assets/boys dress.png',
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
                  title: 'Girls',
                  imagePath: 'android/images/assets/girl dress.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'clothing sets',
                  imagePath: 'android/images/assets/clothing set.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'frocks',
                  imagePath: 'android/images/assets/frocks.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'boys ethnic',
                  imagePath: 'android/images/assets/boys ethnic.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'Girls Ethnic',
                  imagePath:  'android/images/assets/girls ethnic.png',
                  onTap: () {},
                ),
              ],
            ),
            CategorySection(
              title: 'KIDS FOOTWEAR',
              categories: [
                CategoryItem(
                  title: 'Kids Footwear',
                  imagePath: 'android/images/assets/kids footwaer.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'Kids Accessories',
                  imagePath: 'android/images/assets/kids accessories.png',
                  onTap: () {},
                ),
                CategoryItem(
                  title: 'Baby Bedding',
                  imagePath: 'android/images/assets/baby bedding.png',
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
                  ? Image.asset(
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

