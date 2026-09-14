import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/main.dart';

void main() {
  testWidgets('Portfolio home page renders the hero section', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    expect(find.byType(PortfolioHomePage), findsOneWidget);
  });
}
