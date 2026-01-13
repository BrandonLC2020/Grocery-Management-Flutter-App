class User {
  const User({
    required this.id,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
    this.isActive = true,
    this.isStaff = false,
    this.phoneNumber,
    this.bio,
    this.lastLogin,
  });

  final int id;
  final String username;
  final String email;
  final String? firstName;
  final String? lastName;
  final bool isActive;
  final bool isStaff;
  final String? phoneNumber;
  final String? bio;
  final DateTime? lastLogin;
}
