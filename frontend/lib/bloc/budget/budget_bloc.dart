import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/models/monthly_budget.dart';
import 'package:grocery_management_frontend/networking/budget_repository.dart';

part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final BudgetRepository _budgetRepository;

  BudgetBloc({required BudgetRepository budgetRepository})
      : _budgetRepository = budgetRepository,
        super(const BudgetState()) {
    on<FetchBudget>(_onFetchBudget);
    on<SetBudget>(_onSetBudget);
  }

  void _onFetchBudget(FetchBudget event, Emitter<BudgetState> emit) async {
    emit(state.copyWith(status: BudgetStatus.loading));
    try {
      final budget =
          await _budgetRepository.getMonthlyBudget(event.year, event.month);
      emit(state.copyWith(status: BudgetStatus.success, budget: budget));
    } catch (e) {
      emit(state.copyWith(status: BudgetStatus.failure));
    }
  }

  void _onSetBudget(SetBudget event, Emitter<BudgetState> emit) async {
    try {
      final budget = await _budgetRepository.setBudget(
          event.year, event.month, event.amount);
      emit(state.copyWith(status: BudgetStatus.success, budget: budget));
    } catch (e) {
      // Handle error
    }
  }
}
