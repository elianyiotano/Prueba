class ApiConstants {
  static String baseUrl = 'http://localhost:3000';
  static String singInEndpoint = '/api/auth/sign_in';
  static String singUpEndpoint = '/api/auth/';
  static String sendResetPasswordEmail = '/api/auth/password';

  static String getListActivity = '/api/user/activity/all';
  static String getUser = '/api/user/';
  static String getMessage = '/api/user/message';

  static String getListEvents = '/api/event/all';
  static String getEvent = '/api/event/:id';

  static String getRanking = '/api/ranking';
}
