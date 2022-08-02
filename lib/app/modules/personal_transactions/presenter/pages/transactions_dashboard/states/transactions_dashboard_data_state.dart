import '../../../../domain/entities/personal_transaction.dart';

class TransactionsDashboardDataState {
  List<String> stats;
  List<PersonalTransaction> items;

  TransactionsDashboardDataState({required this.stats, required this.items});

  TransactionsDashboardDataState.empty()
      : stats = [],
        items = [
          PersonalTransaction(
            id: 't1',
            title: 'Novo Tênis de Corrida',
            value: 310.762,
            date: DateTime.now(),
          ),
          PersonalTransaction(
            id: 't2',
            title: 'Conta de Luz',
            value: 211.307,
            date: DateTime.now(),
          )
        ];

  void addStat(String info) {
    stats.add(info);
  }

  TransactionsDashboardDataState copyWith({
    List<String>? stats,
    List<PersonalTransaction>? items,
  }) {
    return TransactionsDashboardDataState(
      stats: stats ?? this.stats,
      items: items ?? this.items,
    );
  }
}
