import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/models/grocery_trip.dart';
import 'package:grocery_management_frontend/models/purchased_item.dart';
import 'package:grocery_management_frontend/networking/trip_repository.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository _tripRepository;

  TripBloc({required TripRepository tripRepository})
      : _tripRepository = tripRepository,
        super(const TripState()) {
    on<StartTrip>(_onStartTrip);
    on<AddItemToTrip>(_onAddItemToTrip);
    on<FinishTrip>(_onFinishTrip);
  }

  void _onStartTrip(StartTrip event, Emitter<TripState> emit) async {
    try {
      final trip = await _tripRepository.startTrip(event.storeId);
      emit(state.copyWith(status: TripStatus.active, trip: trip));
    } catch (e) {
      emit(state.copyWith(status: TripStatus.error));
    }
  }

  void _onAddItemToTrip(AddItemToTrip event, Emitter<TripState> emit) async {
    if (state.trip == null) return;
    try {
      final newItem = await _tripRepository.addItemToTrip(
          state.trip!.id, event.pantryItemId, event.price);
      final updatedItems = List<PurchasedItem>.from(state.purchasedItems)
        ..add(newItem);
      emit(state.copyWith(purchasedItems: updatedItems));
    } catch (e) {
      // Handle error
    }
  }

  void _onFinishTrip(FinishTrip event, Emitter<TripState> emit) async {
    if (state.trip == null) return;
    try {
      await _tripRepository.finishTrip(state.trip!.id);
      emit(state.copyWith(status: TripStatus.finished));
    } catch (e) {
      emit(state.copyWith(status: TripStatus.error));
    }
  }
}
