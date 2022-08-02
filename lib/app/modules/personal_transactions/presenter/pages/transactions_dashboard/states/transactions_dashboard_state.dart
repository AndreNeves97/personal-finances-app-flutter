// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'transactions_dashboard_data_state.dart';

class TransactionsDashboardState {
  TransactionsDashboardDataState data;

  TransactionsDashboardState({
    required this.data,
  });

  TransactionsDashboardState.empty()
      : data = TransactionsDashboardDataState.empty();

  TransactionsDashboardState copyWith({
    TransactionsDashboardDataState? data,
  }) {
    return TransactionsDashboardState(
      data: data ?? this.data,
    );
  }
}
