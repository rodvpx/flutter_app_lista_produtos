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
}
