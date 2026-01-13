import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_management_frontend/bloc/trips/trip_bloc.dart';
import 'package:grocery_management_frontend/models/grocery_trip.dart';
import 'package:grocery_management_frontend/networking/trip_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockTripRepository extends Mock implements TripRepository {}

void main() {
  group('TripBloc', () {
    late TripRepository tripRepository;

    setUp(() {
      tripRepository = MockTripRepository();
    });

    test('initial state is TripState()', () {
      expect(TripBloc(tripRepository: tripRepository).state, const TripState());
    });

    blocTest<TripBloc, TripState>(
      'emits [active] when StartTrip succeeds',
      setUp: () {
        when(() => tripRepository.startTrip(any()))
            .thenAnswer((_) async => GroceryTrip(
                  id: 1,
                  store: 1,
                  tripDate: DateTime.now(),
                  totalSpent: 0.0,
                ));
      },
      build: () => TripBloc(tripRepository: tripRepository),
      act: (bloc) => bloc.add(StartTrip(storeId: 1)),
      expect: () => [
        isA<TripState>().having(
            (s) => s.status, 'status', TripStatus.active).having(
            (s) => s.trip?.id, 'trip id', 1),
      ],
    );
  });
}
