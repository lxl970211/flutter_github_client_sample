
import 'package:test_stu/models/index.dart';
import 'package:test_stu/states/ProfileChangeNotifier.dart';

/**
 * 用户状态 model
 */
class UserModel extends ProfileChangeNotifier{

  User? get user => profile.user;

  bool get isLogin => user != null;

  set user(User? user){
    if(user?.login != profile.user?.login){
      profile.lastLogin = profile.user?.login;
      profile.user = user;
      notifyListeners();
    }
  }


}