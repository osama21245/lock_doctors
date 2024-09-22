class Apilinks {
  static const String baseUrl = 'https://lockapp.site/main_app/doctors/';

  //auth links

  static const String linkLogin = "${baseUrl}login.php";

  //set faceId model
  static const String linkSetFaceIdModel =
      'https://cac9-156-217-169-34.ngrok-free.app/submit';

  //Home feature links
  static const String linkGetSemesters = "${baseUrl}get_semesters.php";

  static const String linkGetTodaysSessions =
      "${baseUrl}get_doctor_todays_sessions.php";

  static const String linkRunDoctorSession =
      "${baseUrl}run_doctor_sessions.php";

  static const String linkGetDoctorRunningSessions =
      "${baseUrl}get_doctor_todays_running_sessions.php";

  static const String linkCancelDoctorSession =
      "${baseUrl}cancel_doctor_sessions.php";

  static const String linkFinishDoctorSession =
      "${baseUrl}finish_doctor_sessions.php";

  //doctor feature links

  static const String linkGetDoctorMaterials =
      "${baseUrl}get_doctor_materials.php";

  static const String linkGetDoctorLevels = "${baseUrl}get_doctor_levels.php";

  static const String linkGetSessionsForAMaterial =
      "${baseUrl}get_sessions.php";

  static const String linkGetStudentsAttendanceAtSession =
      "${baseUrl}get_attending_users.php";

  static const String linkGetStudentsTotalAttendTimesAtOneMaterial =
      "${baseUrl}count_student.php";

  //student feature links

  static const String linkGivePenality = "${baseUrl}remove_student.php";

  static const String linkGiveBonus = "${baseUrl}add_student.php";

  static const String linkgetStudentTotalAttendTimeForOneMaterial =
      "${baseUrl}get_sudent_total_attendance_for_one_material.php";

  static const String linkgetStudentTimelineForOneMaterial =
      "${baseUrl}get_student_timeline_for_one_material.php";

  static const String linkSearchForStudent = "${baseUrl}search_for_student.php";
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
