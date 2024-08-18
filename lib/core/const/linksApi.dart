class Apilinks {
  static const String baseUrl = 'https://lockapp.site/main_app/';

  //set faceId model
  static const String linkSetFaceIdModel =
      'https://cac9-156-217-169-34.ngrok-free.app/submit';

  //attendance

  static const String linkGetUserAttendance =
      "https://lockapp.site/main_app/attendance/get_user_attendance.php";

  static const String linkInsertUserAttendance =
      "https://lockapp.site/main_app/attendance/insert_attendance.php";

  static const String linkGetUserSessions =
      "https://lockapp.site/main_app/attendance/get_user_sessions.php";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
