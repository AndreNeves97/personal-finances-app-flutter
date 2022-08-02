import 'package:financefy_app/app/modules/personal_transactions/presenter/pages/transactions_dashboard/states/transactions_dashboard_data_state.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'states/transactions_dashboard_state.dart';

class TransactionsDashboardStore
    extends NotifierStore<Exception, TransactionsDashboardState> {
  TransactionsDashboardStore() : super(TransactionsDashboardState.empty());

  void addStat(String info) {
    final newState = state.copyWith(
        data: state.data.copyWith(stats: state.data.stats.sublist(0)));

    newState.data.addStat(info);

    update(newState);
  }
}
