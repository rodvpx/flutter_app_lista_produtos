import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app_lista_produtos/main.dart';

void main() {
  testWidgets('App inicia na tela de catálogo com produtos', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Catálogo de Produtos'), findsOneWidget);
    expect(find.text('Notebook Gamer'), findsOneWidget);
    expect(find.text('Eletrônicos'), findsOneWidget);
  });

  testWidgets('Tocar em um produto exibe SnackBar de carrinho', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Notebook Gamer'));
    await tester.pump();

    expect(
      find.text('Notebook Gamer adicionado ao carrinho!'),
      findsOneWidget,
    );
  });

  testWidgets('Botão Comprar exibe SnackBar de carrinho', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Comprar').first);
    await tester.pump();

    expect(
      find.text('Notebook Gamer adicionado ao carrinho!'),
      findsOneWidget,
    );
  });

  testWidgets('Cadastrar produto mantém os produtos existentes', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Novo produto'));
    await tester.pumpAndSettle();

    expect(find.text('Cadastrar Produto'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Nome do Produto'),
      'Fone Bluetooth',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Preço (R\$)'),
      '199,90',
    );
    await tester.tap(find.text('Cadastrar'));
    await tester.pumpAndSettle();

    expect(find.text('Catálogo de Produtos'), findsOneWidget);
    expect(find.text('Fone Bluetooth'), findsOneWidget);
    expect(find.text('R\$ 199.90'), findsOneWidget);
    // Os produtos que já existiam continuam no catálogo.
    expect(find.text('Notebook Gamer'), findsOneWidget);
    expect(find.text('Camiseta Algodão'), findsOneWidget);
    expect(find.text('O Livro do Flutter'), findsOneWidget);
  });
}
