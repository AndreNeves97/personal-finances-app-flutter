// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

import '../../../../domain/entities/personal_transaction.dart';
import '../models/transactions_summary_model.dart';

class TransactionsDashboardDataState {
  static const pastDaysLimitForRecentTransactions = 6;

  List<TransactionsSummaryModel> summaryItems;
  List<PersonalTransaction> transactions;

  TransactionsDashboardDataState({
    required this.summaryItems,
    required this.transactions,
  });

  TransactionsDashboardDataState.empty()
      : summaryItems = [],
        transactions = [
          PersonalTransaction(
            title: 'Uber',
            value: 15,
            date: DateTime.now().subtract(const Duration(days: 7)),
          ),
          PersonalTransaction(
            title: 'Lanche',
            value: 25,
            date: DateTime.now().subtract(const Duration(days: 6)),
          ),
          PersonalTransaction(
            title: 'Mercado',
            value: 25,
            date: DateTime.now().subtract(const Duration(days: 2)),
          ),
          PersonalTransaction(
            title: 'Lanche',
            value: 25,
            date: DateTime.now().subtract(const Duration(days: 2)),
          ),
          PersonalTransaction(
            title: 'Uber',
            value: 25,
            date: DateTime.now().subtract(const Duration(days: 1)),
          ),
          PersonalTransaction(
            title: 'Cartão de crédito',
            value: 1000,
            date: DateTime.now().subtract(const Duration(days: 1)),
          ),
          PersonalTransaction(
            title: 'Novo tênis de corrida',
            value: 100,
            date: DateTime.now(),
          ),
          PersonalTransaction(
            title: 'Outros',
            value: 10000,
            date: DateTime.now(),
          ),
        ] {
    _calculateSummary();
  }

  DateTime get _dateLimitForRecentCriteria {
    final now = DateTime.now();

    return now.subtract(
      const Duration(days: pastDaysLimitForRecentTransactions),
    );
  }

  List<PersonalTransaction> get _recentTransactions {
    final dateLimit = _dateLimitForRecentCriteria;

    return transactions.where((transaction) {
      if (transaction.date.isAfter(_dateLimitForRecentCriteria)) {
        return true;
      }

      if (transaction.date.year == dateLimit.year &&
          transaction.date.month == dateLimit.month &&
          transaction.date.day == dateLimit.day) {
        return true;
      }

      return false;
    }).toList();
  }

  void addTransaction(PersonalTransaction transaction) {
    transaction.id = transactions.length.toString();
    transactions.add(transaction);

    transactions.sort((a, b) {
      final dateComparation = a.date.compareTo(b.date);

      if (dateComparation != 0) {
        return dateComparation;
      }

      return a.id.compareTo(b.id);
    });

    _calculateSummary();
  }

  void _calculateSummary() {
    Map<String, double> summaryMap = _baseSummaryMap;
    double total = 0;

    for (var transaction in _recentTransactions) {
      final groupName = getGroupNameFromDate(transaction.date);
      var summary = summaryMap[groupName] ?? 0;

      summaryMap[groupName] = summary + transaction.value;
      total += transaction.value;
    }

    summaryItems = summaryMap.entries.map((entry) {
      return TransactionsSummaryModel(
        groupName: entry.key,
        amount: entry.value,
        amountPercentage: entry.value / total,
      );
    }).toList();
  }

  Map<String, double> get _baseSummaryMap {
    final dateLimit = _dateLimitForRecentCriteria;
    final now = DateTime.now();

    var currentDate = dateLimit;

    Map<String, double> summaryMap = {};

    while (!currentDate.isAfter(now)) {
      final groupName = getGroupNameFromDate(currentDate);
      summaryMap[groupName] = 0;

      currentDate = currentDate.add(const Duration(days: 1));
    }

    return summaryMap;
  }

  String getGroupNameFromDate(DateTime date) {
    return DateFormat.E().format(date);
  }

  TransactionsDashboardDataState copyWith({
    List<TransactionsSummaryModel>? summaryItems,
    List<PersonalTransaction>? transactions,
  }) {
    return TransactionsDashboardDataState(
      summaryItems: summaryItems ?? this.summaryItems,
      transactions: transactions ?? this.transactions,
    );
  }
}
