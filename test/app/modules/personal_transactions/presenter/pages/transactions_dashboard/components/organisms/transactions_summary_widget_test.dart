import 'package:financefy_app/app/modules/personal_transactions/presenter/pages/transactions_dashboard/components/organisms/transactions_summary_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

main() {
  group('TransactionsSummaryWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(
          buildTestableWidget(TransactionsSummaryWidget(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
