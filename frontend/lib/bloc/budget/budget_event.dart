part of 'budget_bloc.dart';

abstract class BudgetEvent {}

class FetchBudget extends BudgetEvent {
  final int month;
  final int year;

  FetchBudget({required this.month, required this.year});
}

class SetBudget extends BudgetEvent {
  final int month;
  final int year;
  final double amount;

  SetBudget({required this.month, required this.year, required this.amount});
}
