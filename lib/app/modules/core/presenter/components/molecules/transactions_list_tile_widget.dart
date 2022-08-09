import 'package:financefy_app/app/modules/core/presenter/styles/app_colors.dart';
import 'package:financefy_app/app/modules/personal_transactions/domain/entities/personal_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../styles/app_spacing_styles.dart';
import '../../styles/app_text_styles.dart';

class TransactionsListTileWidget extends StatelessWidget {
  final PersonalTransaction item;

  const TransactionsListTileWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd MMM yyyy");
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: "R\$");

    return ListTile(
      contentPadding: AppSpacingStyles.contentHorizontalPadding,
      leading: _PriceBadge(item: item),
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        dateFormat.format(item.date),
        style: TextStyle(
          color: AppColors.darkerGrey,
        ),
      ),
      trailing: Text(currencyFormat.format(item.value)),
      onTap: () {},
    );
  }
}

class _PriceBadge extends StatelessWidget {
  const _PriceBadge({
    Key? key,
    required this.item,
  }) : super(key: key);

  final PersonalTransaction item;

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: "R\$");

    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColorDark,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FittedBox(
          child: Text(
            currencyFormat.format(item.value),
            style: Theme.of(context).primaryTextTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
