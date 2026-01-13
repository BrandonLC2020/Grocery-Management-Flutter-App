import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/bloc/auth/auth_bloc.dart';
import 'package:grocery_management_frontend/bloc/budget/budget_bloc.dart';
import 'package:grocery_management_frontend/bloc/pantry/pantry_bloc.dart';
import 'package:grocery_management_frontend/bloc/store/store_bloc.dart';
import 'package:grocery_management_frontend/bloc/trips/trip_bloc.dart';
import 'package:grocery_management_frontend/networking/api/api_client.dart';
import 'package:grocery_management_frontend/networking/auth_repository.dart';
import 'package:grocery_management_frontend/networking/budget_repository.dart';
import 'package:grocery_management_frontend/networking/pantry_repository.dart';
import 'package:grocery_management_frontend/networking/store_repository.dart';
import 'package:grocery_management_frontend/networking/trip_repository.dart';
import 'package:grocery_management_frontend/screens/auth/login_screen.dart';
import 'package:grocery_management_frontend/screens/auth/register_screen.dart';
import 'package:grocery_management_frontend/screens/dashboard/home_screen.dart';
import 'package:grocery_management_frontend/services/app_config.dart';
import 'package:grocery_management_frontend/services/startup_services.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  StartupServices.startServices();

  const String environment = String.fromEnvironment('ENV', defaultValue: 'dev');

  await AppConfig.load(environment);

  ApiClient().init(AppConfig.baseUrl);

  runApp(
    const ToastificationWrapper(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => PantryRepository()),
        RepositoryProvider(create: (context) => StoreRepository()),
        RepositoryProvider(create: (context) => TripRepository()),
        RepositoryProvider(create: (context) => BudgetRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PantryBloc(
              pantryRepository: context.read<PantryRepository>(),
            )..add(FetchPantryItems()),
          ),
          BlocProvider(
            create: (context) => StoreBloc(
              storeRepository: context.read<StoreRepository>(),
            )..add(FetchStores()),
          ),
          BlocProvider(
            create: (context) => TripBloc(
              tripRepository: context.read<TripRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => BudgetBloc(
              budgetRepository: context.read<BudgetRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Grocery Management',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AuthWrapper(),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/home': (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          return const HomeScreen();
        }
        return const LoginScreen();
      },
    );
  }
}