import 'dart:math';

import 'package:financefy_app/app/modules/personal_transactions/domain/entities/personal_transaction.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'models/transactions_summary_model.dart';
import 'states/transactions_dashboard_state.dart';

class TransactionsDashboardStore
    extends NotifierStore<Exception, TransactionsDashboardState> {
  TransactionsDashboardStore() : super(TransactionsDashboardState.empty());

  List<PersonalTransaction> getTransactions() {
    return state.data.transactions;
  }

  List<TransactionsSummaryModel> getSummaryItems() {
    return state.data.summaryItems;
  }

  void addTransaction(PersonalTransaction transaction) {
    final newState = state.copyWith(
      data: state.data.copyWith(
        summaryItems: state.data.summaryItems,
        transactions: state.data.transactions.sublist(0),
      ),
    );

    newState.data.addTransaction(transaction);

    update(newState);
  }
}
