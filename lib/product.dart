import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String category;

  Product({required this.name, required this.price, required this.category});

  IconData get icon {
    switch (category) {
      case 'Eletrônicos':
        return Icons.devices;
      case 'Vestuário':
        return Icons.checkroom;
      case 'Alimentação':
        return Icons.restaurant;
      case 'Livros':
        return Icons.book;
      default:
        return Icons.shopping_bag;
    }
  }
}
