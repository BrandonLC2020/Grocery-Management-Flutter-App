import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/models/pantry_item.dart';
import 'package:grocery_management_frontend/networking/pantry_repository.dart';

part 'pantry_event.dart';
part 'pantry_state.dart';

class PantryBloc extends Bloc<PantryEvent, PantryState> {
  final PantryRepository _pantryRepository;

  PantryBloc({required PantryRepository pantryRepository})
      : _pantryRepository = pantryRepository,
        super(const PantryState()) {
    on<FetchPantryItems>(_onFetchPantryItems);
    on<AddPantryItem>(_onAddPantryItem);
    on<UpdatePantryItem>(_onUpdatePantryItem);
    on<DeletePantryItem>(_onDeletePantryItem);
  }

  void _onFetchPantryItems(
      FetchPantryItems event, Emitter<PantryState> emit) async {
    emit(state.copyWith(status: PantryStatus.loading));
    try {
      final items = await _pantryRepository.getPantryItems();
      emit(state.copyWith(status: PantryStatus.success, items: items));
    } catch (e) {
      emit(state.copyWith(status: PantryStatus.failure));
    }
  }

  void _onAddPantryItem(AddPantryItem event, Emitter<PantryState> emit) async {
    try {
      final newItem = await _pantryRepository.createPantryItem(
          event.name, event.quantity, event.categoryId);
      final updatedItems = List<PantryItem>.from(state.items)..add(newItem);
      emit(state.copyWith(status: PantryStatus.success, items: updatedItems));
    } catch (e) {
      // Handle error
    }
  }

  void _onUpdatePantryItem(
      UpdatePantryItem event, Emitter<PantryState> emit) async {
    try {
      final updatedItem =
          await _pantryRepository.updatePantryItemQuantity(event.id, event.quantity);
      final newItems = state.items.map((item) {
        return item.id == updatedItem.id ? updatedItem : item;
      }).toList();
      emit(state.copyWith(items: newItems));
    } catch (e) {
      // Handle error
    }
  }

  void _onDeletePantryItem(
      DeletePantryItem event, Emitter<PantryState> emit) async {
    try {
      await _pantryRepository.deletePantryItem(event.id);
      final updatedItems =
          state.items.where((item) => item.id != event.id).toList();
      emit(state.copyWith(items: updatedItems, status: PantryStatus.success));
    } catch (e) {
      // Handle error
    }
  }
}
