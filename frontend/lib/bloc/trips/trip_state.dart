part of 'trip_bloc.dart';

enum TripStatus { initial, active, finished, error }

class TripState {
  final TripStatus status;
  final GroceryTrip? trip;
  final List<PurchasedItem> purchasedItems;

  const TripState({
    this.status = TripStatus.initial,
    this.trip,
    this.purchasedItems = const [],
  });

  TripState copyWith({
    TripStatus? status,
    GroceryTrip? trip,
    List<PurchasedItem>? purchasedItems,
  }) {
    return TripState(
      status: status ?? this.status,
      trip: trip ?? this.trip,
      purchasedItems: purchasedItems ?? this.purchasedItems,
    );
  }
}
