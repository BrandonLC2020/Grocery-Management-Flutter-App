part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class LogoutRequested extends AuthEvent {}

class RegistrationRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;

  RegistrationRequested({
    required this.username,
    required this.email,
    required this.password,
  });
}
