import 'package:financefy_app/app/modules/personal_transactions/presenter/pages/transactions_dashboard/transactions_dashboard_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TransactionsDashboardStore store;

  setUpAll(() {
    store = TransactionsDashboardStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
