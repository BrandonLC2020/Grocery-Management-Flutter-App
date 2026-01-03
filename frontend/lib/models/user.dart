class User {
  const User({
    required this.id,
    required this.username,
    required this.email,
    this.phoneNumber,
    this.bio,
    this.lastLogin,
  });

  final int id;
  final String username;
  final String email;
  final String? phoneNumber;
  final String? bio;
  final DateTime? lastLogin;
}
