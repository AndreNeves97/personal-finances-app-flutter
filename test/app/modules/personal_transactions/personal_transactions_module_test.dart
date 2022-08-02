import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:financefy_app/app/modules/personal_transactions/personal_transactions_module.dart';

void main() {
  setUpAll(() {
    initModule(PersonalTransactionsModule());
  });
}
