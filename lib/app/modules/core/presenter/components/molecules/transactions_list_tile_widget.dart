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

    return Card(
      elevation: 5,
      child: Padding(
        padding: AppSpacingStyles.contentHorizontalPadding,
        child: Row(
          children: [
            _PriceBadge(item: item),
            _ItemDescription(item: item, dateFormat: dateFormat),
          ],
        ),
      ),
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
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.purple,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        currencyFormat.format(item.value),
        style: AppTextStyles.bold.copyWith(
          fontSize: 20,
          color: AppColors.purple,
        ),
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({
    Key? key,
    required this.item,
    required this.dateFormat,
  }) : super(key: key);

  final PersonalTransaction item;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: AppTextStyles.heading,
        ),
        Text(
          dateFormat.format(item.date),
          style: TextStyle(
            color: AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
