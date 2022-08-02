import 'package:financefy_app/app/modules/core/presenter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'states/transactions_dashboard_state.dart';
import 'transactions_dashboard_store.dart';

import 'components/organisms/transactions_details_widget.dart';
import 'components/organisms/transactions_stats_widget.dart';

class TransactionsDashboardPage extends StatefulWidget {
  final String title;
  const TransactionsDashboardPage({Key? key, this.title = 'FinanceFy'})
      : super(key: key);

  @override
  TransactionsDashboardPageState createState() =>
      TransactionsDashboardPageState();
}

class TransactionsDashboardPageState extends State<TransactionsDashboardPage> {
  TransactionsDashboardStore get store =>
      Modular.get<TransactionsDashboardStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScopedBuilder<TransactionsDashboardStore, Exception,
          TransactionsDashboardState>(
        store: store,
        onState: (_, state) => _Body(store: store),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.store,
  }) : super(key: key);

  final TransactionsDashboardStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsStatsWidget(store: store),
        Expanded(
          child: TransactionsDetailsWidget(store: store),
        ),
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Nome",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Valor (R\$)",
                  ),
                ),
                TextButton(
                  child: Text(
                    "Adicionar transação",
                    style: TextStyle(
                      color: AppColors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
