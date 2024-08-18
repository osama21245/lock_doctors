import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lock_doctors/core/secrets/app_secrets.dart';

const String region = 'us-sv'; // Your region

Future<Map> createRoom() async {
  const url = 'https://api.netless.link/v5/rooms';

  final headers = {
    'token': AppSecrets.whiteBoardSdkToken,
    'Content-Type': 'application/json',
    'region': 'us-sv',
  };

  final body = jsonEncode({
    'isRecord': false,
  });

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Room created successfully: ${response.body}');
      final responseData = jsonDecode(response.body);
      return generateRoomToken(responseData['uuid']);
    } else {
      print('Failed to create room: ${response.statusCode} ${response.body}');
      throw Exception('Failed to create room');
    }
  } catch (e) {
    print('Exception during room creation: $e');
    throw Exception('Failed to create room: $e');
  }
}

Future<Map> generateRoomToken(String roomUuid) async {
  // final String token = base64Encode(
  //     utf8.encode('$accessKey:${hmacSha256(secretKey, 'YOUR_TIMESTAMP')}'));
  final response = await http.post(
    Uri.parse('https://api.netless.link/v5/tokens/rooms/$roomUuid'),
    headers: {
      'token': AppSecrets.whiteBoardSdkToken,
      'Content-Type': 'application/json',
      'region': region,
    },
    body: jsonEncode({
      'lifespan': 3600000,
      'role': 'admin',
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    final responseData = jsonDecode(response.body);
    return {"token": responseData, "room_uuid": roomUuid};
  } else {
    print('Failed to create room: ${response.statusCode} ${response.body}');
    throw Exception('Failed to create room');
  }
}

String hmacSha256(String key, String data) {
  var hmac = Hmac(sha256, utf8.encode(key)); // Create HMAC-SHA256
  var digest = hmac.convert(utf8.encode(data));
  return base64Encode(digest.bytes);
}
