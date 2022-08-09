import 'package:financefy_app/app/modules/core/presenter/styles/app_spacing_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/presenter/components/molecules/chart_bar_widget.dart';
import '../../transactions_dashboard_store.dart';

class TransactionsSummaryWidget extends StatelessWidget {
  final TransactionsDashboardStore store;

  const TransactionsSummaryWidget({Key? key, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final summaryItems = store.getSummaryItems();

    return Padding(
      padding: AppSpacingStyles.contentPadding,
      child: Card(
        elevation: 6,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: summaryItems
                .map(
                  (summaryItem) => ChartBarWidget(
                    label: summaryItem.groupName,
                    value: summaryItem.formattedAmount,
                    percentage: summaryItem.amountPercentage,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
