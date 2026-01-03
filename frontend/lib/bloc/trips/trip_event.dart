part of 'trip_bloc.dart';

abstract class TripEvent {}

class StartTrip extends TripEvent {
  final int storeId;

  StartTrip({required this.storeId});
}

class AddItemToTrip extends TripEvent {
  final int pantryItemId;
  final double price;

  AddItemToTrip({required this.pantryItemId, required this.price});
}

class FinishTrip extends TripEvent {}
