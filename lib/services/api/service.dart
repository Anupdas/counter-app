import '../../models/user.dart';

/// Api Contract will often have API Modles
/// which may be different to the domain models
/// which could be different or hide some data
/// available in api service
abstract class ApiService {
  Future<List<User>> fetchUsers();
}

/// Exceptions thrown by ApiService
class ApiException {
  final int code;
  final String errorMessage;

  ApiException(this.code, this.errorMessage);
}
