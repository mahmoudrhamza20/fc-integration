import 'package:get_storage/get_storage.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/models/user_model.dart';
import 'package:shared/screens/login_screen.dart';

abstract class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static UserModel? get getUserInfo {
    if (_box.hasData('user')) return UserModel.fromJson(_box.read('user'));
    return null;
  }

  static String? get getPassword {
    if (_box.hasData('password')) return _box.read('password');
    return null;
  }

  static String? get getToken {
    if (_box.hasData('token')) return _box.read('token');
    return null;
  }

  static String get getLang {
    if (_box.hasData('language')) {
      return _box.read('language');
    }
    return 'en';
  }

  static bool get isLogged => getUserInfo != null;

  static Future<void> cacheUserInfo(UserModel userModel) =>
      _box.write('user', userModel.toJson());

  static Future<void> cacheLang(String lang) => _box.write('language', lang);

  static Future<void> cachePasswordUserInfo(String passwoed) =>
      _box.write('password', passwoed);

  static Future<void> cacheToken(String token) => _box.write('token', token);
  static Future<void> isLoged(bool isloged) => _box.write('islogin', isloged);

  static int get getUserId => getUserInfo!.data.user.id;

  static String get getCurrentLang => getLang;

  static String get getPasswordUserInfo => getPassword!;
  static String get getTokenInfo => getToken!;

  static UserModel get getUserData => getUserInfo!;

  static Future<void> signOut() async {
    await _box.erase();
    MagicRouter.navigateAndPopAll(const LoginScreen());
  }
}
