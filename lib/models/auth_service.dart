import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService  extends ChangeNotifier{

  static late final SharedPreferences _prefs ;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  Future<void> loginUser(String userName) async {
    try {
      //store user login info  in sharedpreferences once logged in
      _prefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isLoggedIn() async
  {
    String? username = await  _prefs.getString('userName');
    if(username==null) return false;
    return true;
  }
  void logoutUser()  {
    //clear everything in sharedpreferences onces logout
    _prefs.clear();
  }

  String? getUsername()  {
    return _prefs.getString('userName') ?? 'DefaultValue';
  }


  void updateUserName(String newName)
  {
    _prefs.setString('userName', newName);
    notifyListeners();


  }
}
