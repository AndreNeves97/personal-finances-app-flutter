import '../../../../domain/entities/personal_transaction.dart';

class TransactionsDashboardDataState {
  List<String> stats;
  List<PersonalTransaction> transactions;

  TransactionsDashboardDataState(
      {required this.stats, required this.transactions});

  TransactionsDashboardDataState.empty()
      : stats = [],
        transactions = [
          PersonalTransaction(
            title: 'Novo Tênis de Corrida',
            value: 310.762,
            date: DateTime.now(),
          ),
          PersonalTransaction(
            title: 'Conta de Luz',
            value: 211.307,
            date: DateTime.now(),
          )
        ];

  void addStat(String info) {
    stats.add(info);
  }

  void addTransaction(PersonalTransaction transaction) {
    transaction.id = transactions.length.toString();
    transactions.add(transaction);
  }

  TransactionsDashboardDataState copyWith({
    List<String>? stats,
    List<PersonalTransaction>? transactions,
  }) {
    return TransactionsDashboardDataState(
      stats: stats ?? this.stats,
      transactions: transactions ?? this.transactions,
    );
  }
}
