// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionsSummaryModel {
  final String groupName;
  final double amount;
  final String formattedAmount;
  final double amountPercentage;

  TransactionsSummaryModel({
    required this.groupName,
    required this.amount,
    required this.amountPercentage,
  }) : formattedAmount =
            "R\$ ${amount.toStringAsFixed(2).replaceFirst(".", ",")}";
}
