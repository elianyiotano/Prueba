class ApiConstants {

  static String baseUrl = 'https://loyalty.peppermind.io';
  static String singInEndpoint = '/auth/login';
  static String singUpEndpoint = '/auth/signup';
  static String sendResetPasswordEmail = '/auth/password/reset';

  static String getListMessage = '/messages';

  static String getListCoupons = '/coupons';
  static String postQr = '/coupons/validate';

  static String getRanking = '/users/ranking';

  static String getPhoto = '/users/profile_photo';
  static String postPhoto = '/users/profile_photo';
}
