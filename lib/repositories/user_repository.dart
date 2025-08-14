import '../models/user.dart';
import '../services/api/service.dart';

/// Repositories are used by the bloc or cubit to get domain data
/// The domain models are often called business models, as they are
/// given to the presentation layer as per the business logic
/// the services deal with the data transfer objects from api, database
/// they are kept separate to accommodate any change due to the
/// difference in the changes due to versioning
class UserRepository {
  /// The service is injected to switch the service easily to mock and test
  /// the repo independently
  final ApiService service;

  UserRepository(this.service);

  /// The users are cached with a cache policy
  List<User>? _users;

  /// Get Users from api service
  Future<List<User>> getUsers() async {
    if (_users?.isNotEmpty ?? false) {
      return _users!;
    }

    return _users = await service.fetchUsers();
  }
}
