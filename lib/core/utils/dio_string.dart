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
  // static const String governments = 'governorates/1';
  static const String countries = 'countries';
  static const String search = 'search';
  static const String joinGroup = 'joinGroup';
  static const String establishGroup = 'establishGroup';
  // static const String searchKeywords = 'groupNumber?numbers=2';
  static const String checkPhoneToResetPass = 'users/requestReset';
  static const String checkOtpToResetPass = 'users/verifyOtp';
  static const String resetPassword = 'users/resetPassword';

  static String groupById({required int id}) {
    return 'groups/$id';
  }

  static String governments({required int countryId}) {
    return 'governorates/$countryId';
  }

  static String cities({required int governmentId}) {
    return 'cities/$governmentId';
  }

  static String stageById({required int id}) {
    return 'stages/$id';
  }

  static String searchKeywords({required int id}) {
    return 'groupNumber?numbers=$id';
  }
}
