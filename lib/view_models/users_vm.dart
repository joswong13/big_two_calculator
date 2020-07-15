import 'package:big_two_calculator/data_models/users_database.dart';
import 'package:big_two_calculator/models/user.dart';
import 'package:big_two_calculator/models/user_stats.dart';
import 'package:intl/intl.dart';

class UsersVM {
  UsersVM();

  UserDatabase _userDB = UserDatabase();

  Future<void> insertUser(String name) async {
    int dateAdded = DateTime.now().millisecondsSinceEpoch;

    await _userDB.insert(User.newUser(name, dateAdded), UserStats.createEmptyUserStat());
  }

  Future<List<User>> getAll() async {
    List<Map<String, dynamic>> allUsers = await _userDB.getAllUsers();
    List<User> usersList = [];
    allUsers.forEach((user) {
      usersList.add(User.fromDb(user));
    });

    return usersList;
  }

  Future<UserStats> getUserStats(int id) async {
    List<Map<String, dynamic>> listOfUserStats = await _userDB.getUserStat(id);

    return UserStats.fromDb(listOfUserStats[0]);
  }

  Future<int> delete(int id) async {
    return await _userDB.delete(id);
  }
}
