import 'dart:convert';

String basicAuth = 'Basic ' + base64Encode(utf8.encode("osama:osama1234"));

class AppSecrets {
  static const String agoraAppId = "d9aadbc447c440baaf77d28b4083d4c9";
  static const String whiteBoardAppId = "mH50sEe9Ee-jMu3VRK-jAA/mjz2rX5gMwXCRQ";
  static const String whiteBoardSdkToken =
      "NETLESSSDK_YWs9QWFtRTAwMHhEQko2LUs3QyZub25jZT1hZmRiN2Q0MC00N2Q4LTExZWYtYTMzMi1lZGQ1NDRhZmEzMDAmcm9sZT0wJnNpZz1iN2Q3YjAzNTM0MjU4NjkxYmMwNGQxOGJkNGU0YjA2ZmMwMmUwMmQyMTZhNjYxMTlkZjRhYWVkN2IyNDg1YzM1";
  static const String tempToken =
      "007eJxTYNhcVhb0fdMNTpnS54LHeibcK+KN6CtWD9GwXFAS9jbIzlKBIcUyMTElKdnExByIDZISE9PMzVOMLJJMDCyMU0ySLTtnTElrCGRkuBWlzMrIAIEgPjtDSWpxiaGRMQMDAJA6H6I=";

  static Map<String, String> myheaders = {'authorization': basicAuth};
}
