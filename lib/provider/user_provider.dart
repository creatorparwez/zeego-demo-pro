// Auth Repository Instance
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:new_zeego_proo/models/user_model.dart';
import 'package:new_zeego_proo/repository/auth_repository.dart';
import 'package:new_zeego_proo/repository/user_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// Loading
final isLoadingProvider = StateProvider<bool>((ref) => false);

// Users Repository Instance
final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  return UsersRepository();
});

// To get All Users
final allUsersProvider = StreamProvider<List<UserModel>>((ref) {
  final repo = ref.read(usersRepositoryProvider);
  return repo.getAllUsers();
});

// To get userData by Id
final userDataProvider = StreamProvider.family<UserModel, String>((
  ref,
  userId,
) {
  final repo = ref.watch(usersRepositoryProvider);
  return repo.getUserDataById(userId);
});
