import 'package:financefy_app/app/modules/core/presenter/components/molecules/transactions_list_tile_widget.dart';
import 'package:financefy_app/app/modules/personal_transactions/domain/entities/personal_transaction.dart';
import 'package:flutter/material.dart';

import '../../transactions_dashboard_store.dart';

class TransactionsDetailsWidget extends StatelessWidget {
  final TransactionsDashboardStore store;

  const TransactionsDetailsWidget({Key? key, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = store.getTransactions();

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) => TransactionsListTileWidget(
        item: items[i],
      ),
    );
  }
}
