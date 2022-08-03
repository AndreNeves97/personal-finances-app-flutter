import 'package:financefy_app/app/modules/core/presenter/styles/app_colors.dart';
import 'package:financefy_app/app/modules/personal_transactions/domain/entities/personal_transaction.dart';
import 'package:flutter/material.dart';

class TransactionFormWidget extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(PersonalTransaction transaction) onSubmit;

  TransactionFormWidget({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: "Título",
          ),
        ),
        TextField(
          controller: valueController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => _submit(),
          decoration: const InputDecoration(
            labelText: "Valor (R\$)",
          ),
        ),
        TextButton(
          onPressed: _submit,
          child: Text(
            "Adicionar transação",
            style: TextStyle(
              color: AppColors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  void _submit() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    titleController.clear();
    valueController.clear();
    FocusManager.instance.primaryFocus?.unfocus();

    final transaction = PersonalTransaction(
      title: title,
      value: value,
      date: DateTime.now(),
    );

    onSubmit(transaction);
  }
}
