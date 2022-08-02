import 'presenter/pages/transactions_dashboard/transactions_dashboard_page.dart';
import 'presenter/pages/transactions_dashboard/transactions_dashboard_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PersonalTransactionsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TransactionsDashboardStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const TransactionsDashboardPage()),
  ];
}
