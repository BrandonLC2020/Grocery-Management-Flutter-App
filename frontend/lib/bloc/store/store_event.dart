part of 'store_bloc.dart';

abstract class StoreEvent {}

class FetchStores extends StoreEvent {}

class AddStore extends StoreEvent {
  final String name;
  final String address;

  AddStore({required this.name, required this.address});
}
