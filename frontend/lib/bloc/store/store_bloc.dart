import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/models/store.dart';
import 'package:grocery_management_frontend/networking/store_repository.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository _storeRepository;

  StoreBloc({required StoreRepository storeRepository})
      : _storeRepository = storeRepository,
        super(const StoreState()) {
    on<FetchStores>(_onFetchStores);
    on<AddStore>(_onAddStore);
  }

  void _onFetchStores(FetchStores event, Emitter<StoreState> emit) async {
    emit(state.copyWith(status: StoreStatus.loading));
    try {
      final stores = await _storeRepository.getStores();
      emit(state.copyWith(status: StoreStatus.success, stores: stores));
    } catch (e) {
      emit(state.copyWith(status: StoreStatus.failure));
    }
  }

  void _onAddStore(AddStore event, Emitter<StoreState> emit) async {
    try {
      final newStore = await _storeRepository.createStore(event.name, event.address);
      final updatedStores = List<Store>.from(state.stores)..add(newStore);
      emit(state.copyWith(status: StoreStatus.success, stores: updatedStores));
    } catch (e) {
      // Handle error, maybe emit a failure state
    }
  }
}
