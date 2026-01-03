part of 'budget_bloc.dart';

abstract class BudgetEvent {}

class FetchBudget extends BudgetEvent {
  final int month;
  final int year;

  FetchBudget({required this.month, required this.year});
}
