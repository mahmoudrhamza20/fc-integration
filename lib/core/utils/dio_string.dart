class EndPoints {
  //------------------------------------------------------------------------//
  static const String baseUrl = 'https://construction.tofitnesss.com/api/';
  //------------------------------------------------------------------------//

  static const String login = 'users/login';
  static const String register = 'users/register';
  static const String logout = 'users/logout';
  static const String checkOtp = 'users/checkOtp';
  static const String checkPhone = 'users/phone';
  static const String terms = 'terms';
  static const String groups = 'groups';
  static const String stages = 'stages';
  static const String search = 'search';
  static const String joinGroup = 'joinGroup';
  static const String establishGroup = 'establishGroup';
  static const String searchKeywords = 'groupNumber?numbers=2';

  static String groupById({required int id}) {
    return 'groups/$id';
  }

  static String stageById({required int id}) {
    return 'stages/$id';
  }

  // static String searchKeywords({required int id}) {
  //   return 'groupNumber?numbers=$id';
  // }
}
