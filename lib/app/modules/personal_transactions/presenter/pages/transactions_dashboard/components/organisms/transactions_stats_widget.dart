import 'package:financefy_app/app/modules/core/presenter/styles/app_spacing_styles.dart';
import 'package:flutter/material.dart';

import '../../transactions_dashboard_store.dart';

class TransactionsStatsWidget extends StatelessWidget {
  final TransactionsDashboardStore store;

  const TransactionsStatsWidget({Key? key, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacingStyles.contentPadding,
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: getStats()
                .map(
                  (stat) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(stat),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  List<String> getStats() {
    return store.state.data.stats;
  }
}
