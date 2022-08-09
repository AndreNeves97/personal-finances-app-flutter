import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/personal_transaction.dart';
import '../../components/organisms/transaction_form_widget.dart';
import 'states/transactions_dashboard_state.dart';
import 'transactions_dashboard_store.dart';

import 'components/organisms/transactions_details_widget.dart';
import 'components/organisms/transactions_summary_widget.dart';

class TransactionsDashboardPage extends StatefulWidget {
  final String title;
  const TransactionsDashboardPage({Key? key, this.title = 'Personal finances'})
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
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
          onPressed: _openNewTransactionFormModal,
          icon: const Icon(Icons.add),
        )
      ]),
      body: ScopedBuilder<TransactionsDashboardStore, Exception,
          TransactionsDashboardState>(
        store: store,
        onState: (_, state) => _Body(store: store),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewTransactionFormModal,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _openNewTransactionFormModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: TransactionFormWidget(
            onSubmit: _onSubmitTransactionFormModal,
          ),
        );
      },
    );
  }

  void _onSubmitTransactionFormModal(PersonalTransaction transaction) {
    store.addTransaction(transaction);
    Navigator.of(context).pop();
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            TransactionsSummaryWidget(store: store),
            Expanded(
              child: TransactionsDetailsWidget(store: store),
            ),
          ],
        );
      },
    );
  }
}
