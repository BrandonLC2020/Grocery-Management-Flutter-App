import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/bloc/budget/budget_bloc.dart';
import 'package:grocery_management_frontend/models/monthly_budget.dart';

class BudgetOverviewScreen extends StatelessWidget {
  const BudgetOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Overview'),
      ),
      body: BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) {
          if (state.status == BudgetStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == BudgetStatus.failure) {
            return const Center(child: Text('Failed to fetch budget'));
          }
          if (state.budget == null) {
            return const Center(child: Text('No budget set for this month.'));
          }
          // For now, just display the budget amount.
          // A progress bar would require knowing the total spent, which is not
          // yet available in the budget model.
          return Center(
            child: Text(
              'Monthly Budget: \$${state.budget!.budgetAmount}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Access status to check if we have a budget to pre-fill
          final state = context.read<BudgetBloc>().state;
          _showSetBudgetDialog(context, state.budget);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  void _showSetBudgetDialog(BuildContext context, MonthlyBudget? currentBudget) {
    final amountController = TextEditingController(
      text: currentBudget?.budgetAmount.toString() ?? '',
    );
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Set Monthly Budget'),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final amount = double.parse(amountController.text);
                  final now = DateTime.now();
                  context.read<BudgetBloc>().add(
                        SetBudget(
                          month: now.month,
                          year: now.year,
                          amount: amount,
                        ),
                      );
                  Navigator.of(dialogContext).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
