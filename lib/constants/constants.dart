class ApiConstants {
  //static String baseUrl = 'https://run.mocky.io/v3';
  //static String singInEndpoint = '/a5e013c1-91db-43bf-8538-1bb4296fc056';
  static String baseUrl = 'https://loyalty.peppermind.io';
  static String singInEndpoint = '/auth/login';
  static String singUpEndpoint = '/auth/signup';
  static String sendResetPasswordEmail = '/auth/password/reset';

  static String getListMessage = '/messages';

  static String getListCoupons = '/coupons';
  static String postQr = '/coupons/validate';

  static String getRanking = '/users/ranking';
}
