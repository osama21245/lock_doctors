bool checkIsRequestSuccess(Map response) {
  if (response["status"] == "success") {
    return true;
  } else {
    return false;
  }
}
