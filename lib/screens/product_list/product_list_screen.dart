import 'package:flutter/material.dart';
import 'package:flutter_app_lista_produtos/models/product.dart';
import 'package:flutter_app_lista_produtos/screens/add_product/add_product_screen.dart';
import 'package:flutter_app_lista_produtos/theme/app_theme.dart';

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

  void _addToCart(Product product) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text('${product.name} adicionado ao carrinho!'),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Produtos')),
      body: _products.isEmpty
          ? const _EmptyState()
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 96),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.goldLight.withValues(alpha: 0.55),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          product.icon,
                          color: AppColors.navy,
                          size: 24,
                        ),
                      ),
                      title: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              'R\$ ${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: AppColors.indigo,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            _CategoryBadge(label: product.category),
                          ],
                        ),
                      ),
                      trailing: FilledButton(
                        onPressed: () => _addToCart(product),
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(0, 36),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          visualDensity: VisualDensity.compact,
                        ),
                        child: const Text('Comprar'),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddProductScreen,
        icon: const Icon(Icons.add),
        label: const Text('Novo produto'),
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.goldLight.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.navy,
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 56,
            color: AppColors.navy.withValues(alpha: 0.35),
          ),
          const SizedBox(height: 12),
          Text(
            'Nenhum produto cadastrado.',
            style: TextStyle(color: AppColors.navy.withValues(alpha: 0.6)),
          ),
        ],
      ),
    );
  }
}
