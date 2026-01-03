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
}
