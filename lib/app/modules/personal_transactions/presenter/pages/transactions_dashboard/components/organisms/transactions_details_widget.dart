import 'package:financefy_app/app/modules/core/presenter/components/molecules/transactions_list_tile_widget.dart';
import 'package:flutter/material.dart';

import '../../transactions_dashboard_store.dart';

class TransactionsDetailsWidget extends StatelessWidget {
  final TransactionsDashboardStore store;

  const TransactionsDetailsWidget({Key? key, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = store.getTransactions();

    if (items.isEmpty) {
      return const _EmptyState();
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) => TransactionsListTileWidget(
        item: items[i],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "Nenhuma Transação Cadastrada!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 5),
        const Icon(
          Icons.notes_outlined,
          size: 100,
        )
      ],
    );
  }
}
