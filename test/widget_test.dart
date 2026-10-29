import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app_lista_produtos/main.dart';

void main() {
  testWidgets('App inicia na tela de lista de produtos', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Lista de Produtos'), findsOneWidget);
    expect(find.text('Nenhum produto cadastrado.'), findsOneWidget);
  });
}
