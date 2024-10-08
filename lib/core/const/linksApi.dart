class Apilinks {
  static const String baseUrl = 'https://lockapp.site/main_app/doctors/';

  //set faceId model
  static const String linkSetFaceIdModel =
      'https://cac9-156-217-169-34.ngrok-free.app/submit';

  //focues on doctor

  static const String linkGetDoctorMaterials =
      "${baseUrl}get_doctor_materials.php";

  static const String linkGetSessionsForAMaterial =
      "${baseUrl}get_sessions.php";

  //focues on student

  static const String linkGetStudentsAttendanceAtSession =
      "${baseUrl}get_attending_users.php";

  //doctor controls
  static const String linkGetStudentsTotalAttendTimesAtOneMaterial =
      "${baseUrl}count_student.php";

  static const String linkGivePenality = "${baseUrl}remove_student.php";

  static const String linkGiveBonus = "${baseUrl}add_student.php";
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
