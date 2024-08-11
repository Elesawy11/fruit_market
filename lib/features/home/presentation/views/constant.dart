import 'package:flutter/material.dart';

abstract class HomeConstant {
  static List<String> sectionsName = [
    'Vegetables',
    'Fruits',
    'Dry Fruits',
  ];

  static List<String> fruitDocsId = [
    'Mixed Fruit Pack',
    'Organic Fruits',
    'Stone Fruits',
    'melons',
  ];
    static List<String> vegetablesDocsId = [
    'Allium Vegetabels',
    'Mixed Vegetables Pack',
    'Organic Vegetables',
    'Root Vegetabels',
  ];

  static List<String> dryFruitsDocsId = [
    'Dehiscent Dry Fruits',
    'Indehiscent Dry Fruits',
    'Kashmiri Dry Fruits',
    'Mixed Dry Fruits Pack',
  ];

 static List<List<dynamic>> destinationsList = [
  [
    Icons.home,
    Icons.home_outlined,
    'Home',
  ],
  [
    Icons.shopping_cart,
    Icons.shopping_cart_outlined,
    'Shopping Cart',
  ],
  [
    Icons.favorite,
    Icons.favorite_outline,
    'Favorite',
  ],
  [
    Icons.person,
    Icons.person_outline,
    'My Account',
  ],
];
}
