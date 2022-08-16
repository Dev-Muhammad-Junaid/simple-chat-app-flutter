import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginUser(String userName) async {
    try {
      //store user login info  in sharedpreferences once logged in
      SharedPreferences sharedPrefs = await _prefs;
      sharedPrefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  void logoutUser() async {
    //clear everything in sharedpreferences onces logout
    SharedPreferences sharedPrefs = await _prefs;
    sharedPrefs.clear();
  }

  Future<String?> getUsername() async {
    SharedPreferences sharedPrefs = await _prefs;
    return sharedPrefs.getString('userName') ?? 'DefaultValue';
  }
}
