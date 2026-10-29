import 'package:flutter/material.dart';
import 'package:flutter_app_lista_produtos/screens/product_list/product_list_screen.dart';
import 'package:flutter_app_lista_produtos/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Produtos',
      theme: AppTheme.light,
      home: const ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
