part of 'pantry_bloc.dart';

abstract class PantryEvent {}

class FetchPantryItems extends PantryEvent {}

class AddPantryItem extends PantryEvent {
  final String name;
  final int quantity;
  final int categoryId;

  AddPantryItem(
      {required this.name, required this.quantity, required this.categoryId});
}

class UpdatePantryItem extends PantryEvent {
  final int id;
  final int quantity;

  UpdatePantryItem({required this.id, required this.quantity});
}
