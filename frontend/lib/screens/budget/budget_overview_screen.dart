import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/bloc/budget/budget_bloc.dart';

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
    );
  }
}
