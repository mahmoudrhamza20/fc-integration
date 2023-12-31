import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getBoolean({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }

//set all data type to cache
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    return await sharedPreferences!.setDouble(key, value);
  }

  //get all data type from cache
  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  // remove data from cache
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> clear() async {
    MagicRouter.navigateAndPopAll(const LoginScreen());
    return await sharedPreferences!.clear();
  }
//   Future<void> signOut() async {
//   try {
//     await FirebaseAuth.instance.signOut();
//   } catch (e) {
//     print(e);
//   }
// }
}
