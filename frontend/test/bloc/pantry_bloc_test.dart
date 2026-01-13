import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_management_frontend/bloc/pantry/pantry_bloc.dart';
import 'package:grocery_management_frontend/models/pantry_item.dart';
import 'package:grocery_management_frontend/networking/pantry_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockPantryRepository extends Mock implements PantryRepository {}

void main() {
  group('PantryBloc', () {
    late PantryRepository pantryRepository;

    setUp(() {
      pantryRepository = MockPantryRepository();
    });

    test('initial state is PantryState()', () {
      expect(PantryBloc(pantryRepository: pantryRepository).state,
          const PantryState());
    });

    blocTest<PantryBloc, PantryState>(
      'emits [loading, success] when FetchPantryItems adds items',
      setUp: () {
        when(() => pantryRepository.getPantryItems()).thenAnswer((_) async => [
              PantryItem(
                  id: 1,
                  name: 'Milk',
                  quantity: 1,
                  regularPrice: 2.0,
                  lastUpdated: DateTime.now())
            ]);
      },
      build: () => PantryBloc(pantryRepository: pantryRepository),
      act: (bloc) => bloc.add(FetchPantryItems()),
      expect: () => [
        const PantryState(status: PantryStatus.loading),
        isA<PantryState>().having(
            (s) => s.status, 'status', PantryStatus.success).having(
            (s) => s.items.length, 'items length', 1),
      ],
    );

    blocTest<PantryBloc, PantryState>(
      'emits [success] with new item when AddPantryItem is added',
      setUp: () {
        when(() =>
                pantryRepository.createPantryItem(any(), any(), any()))
            .thenAnswer((_) async => PantryItem(
                id: 2,
                name: 'Bread',
                quantity: 1,
                regularPrice: 3.0,
                lastUpdated: DateTime.now()));
      },
      build: () => PantryBloc(pantryRepository: pantryRepository),
      act: (bloc) => bloc.add(
          AddPantryItem(name: 'Bread', quantity: 1, categoryId: 1)),
      expect: () => [
        isA<PantryState>().having(
            (s) => s.items.length, 'items length', 1),
      ],
    );
  });
}
