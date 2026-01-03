import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/bloc/auth/auth_bloc.dart';
import 'package:grocery_management_frontend/bloc/store/store_bloc.dart';
import 'package:grocery_management_frontend/networking/store_repository.dart';
import 'package:grocery_management_frontend/screens/stores/store_list_screen.dart';
import 'package:grocery_management_frontend/bloc/pantry/pantry_bloc.dart';
import 'package:grocery_management_frontend/networking/pantry_repository.dart';
import 'package:grocery_management_frontend/screens/pantry/pantry_list_screen.dart';
import 'package:grocery_management_frontend/bloc/trips/trip_bloc.dart';
import 'package:grocery_management_frontend/networking/trip_repository.dart';
import 'package:grocery_management_frontend/screens/trips/active_trip_screen.dart';
import 'package:grocery_management_frontend/bloc/budget/budget_bloc.dart';
import 'package:grocery_management_frontend/networking/budget_repository.dart';
import 'package:grocery_management_frontend/screens/budget/budget_overview_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) =>
                        StoreBloc(storeRepository: StoreRepository())
                          ..add(FetchStores()),
                    child: const StoreListScreen(),
                  ),
                ));
              },
              child: const Text('Manage Stores'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) =>
                        PantryBloc(pantryRepository: PantryRepository())
                          ..add(FetchPantryItems()),
                    child: const PantryListScreen(),
                  ),
                ));
              },
              child: const Text('Manage Pantry'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) =>
                              TripBloc(tripRepository: TripRepository()),
                        ),
                        BlocProvider(
                          create: (context) =>
                              StoreBloc(storeRepository: StoreRepository())
                                ..add(FetchStores()),
                        ),
                        BlocProvider(
                          create: (context) =>
                              PantryBloc(pantryRepository: PantryRepository())
                                ..add(FetchPantryItems()),
                        ),
                      ],
                      child: const ActiveTripScreen(),
                    ),
                  ),
                );
              },
              child: const Text('Start Shopping'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final now = DateTime.now();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (context) =>
                          BudgetBloc(budgetRepository: BudgetRepository())
                            ..add(FetchBudget(month: now.month, year: now.year)),
                      child: const BudgetOverviewScreen(),
                    ),
                  ),
                );
              },
              child: const Text('View Budget'),
            ),
          ],
        ),
      ),
    );
  }
}
