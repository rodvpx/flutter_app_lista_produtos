import 'package:flutter/material.dart';
import 'package:flutter_app_lista_produtos/models/product.dart';
import 'package:flutter_app_lista_produtos/screens/add_product/add_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Product> _products = [
    Product(name: 'Notebook Gamer', price: 4500.00, category: 'Eletrônicos'),
    Product(name: 'Camiseta Algodão', price: 79.90, category: 'Vestuário'),
    Product(name: 'O Livro do Flutter', price: 120.00, category: 'Livros'),
  ];

  Future<void> _openAddProductScreen() async {
    final newProduct = await Navigator.push<Product>(
      context,
      MaterialPageRoute(builder: (context) => const AddProductScreen()),
    );

    if (newProduct != null) {
      setState(() {
        _products.add(newProduct);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Icon(product.icon, color: Colors.blue, size: 32),
              title: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'R\$ ${product.price.toStringAsFixed(2)} | ${product.category}',
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} adicionado ao carrinho!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Comprar'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddProductScreen,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
