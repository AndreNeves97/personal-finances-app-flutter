import 'package:financefy_app/app/modules/personal_transactions/presenter/pages/transactions_dashboard/transactions_dashboard_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

main() {
  group('TransactionsDashboardPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(
          buildTestableWidget(TransactionsDashboardPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
