import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/models/user.dart';
import 'package:grocery_management_frontend/networking/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.unknown()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<RegistrationRequested>(_onRegistrationRequested);
  }

  void _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    try {
      final user = await _authRepository.login(event.email, event.password);
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    _authRepository.logout();
    emit(const AuthState.unauthenticated());
  }

  void _onRegistrationRequested(
      RegistrationRequested event, Emitter<AuthState> emit) async {
    try {
      final user = await _authRepository.register(
          event.username, event.email, event.password);
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }
}
