part of 'pantry_bloc.dart';

enum PantryStatus { initial, loading, success, failure }

class PantryState {
  final List<PantryItem> items;
  final PantryStatus status;

  const PantryState({
    this.items = const [],
    this.status = PantryStatus.initial,
  });

  PantryState copyWith({
    List<PantryItem>? items,
    PantryStatus? status,
  }) {
    return PantryState(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }
}
