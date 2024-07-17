import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                Color(0xFF4C53A5), 
            radius: 15,
            child: Icon(
              Icons.person,
              size: 20,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Cathey',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Favorite icon tapped')),
              );
            },
            icon: Icon(Icons.favorite, size: 30, color: Colors.red),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Shopping bag icon tapped')),
              );
            },
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),
        ],
      ),
    );
  }
}
