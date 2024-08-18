bool isBanned(String banDate) {
  DateTime banDateTime = DateTime.parse(banDate);
  DateTime now = DateTime.now();
  print(banDateTime.difference(now).inMinutes);
  return banDateTime.isAfter(now);
}
