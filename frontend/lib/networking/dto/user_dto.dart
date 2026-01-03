import 'package:dart_mappable/dart_mappable.dart';

part 'user_dto.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class UserDto with UserDtoMappable {
  const UserDto({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.email,
    this.phoneNumber,
    this.bio,
    this.lastLogin,
  });

  final int id;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String username;
  final String email;
  final String? phoneNumber;
  final String? bio;
  final DateTime? lastLogin;

  static const fromMap = UserDtoMapper.fromMap;
  static const fromJson = UserDtoMapper.fromJson;
}
