import 'package:flutter/material.dart';

import '../const/helping_lists.dart';

Color getTodayesSessionsCardColors(int i) {
  if (i % 3 == 0) {
    return todaySessionsCardColors[2];
  } else if (i % 2 == 0) {
    return todaySessionsCardColors[1];
  } else {
    return todaySessionsCardColors[0];
  }
}

String getTodaysSessionsCardImages(int i) {
  if (i % 3 == 0) {
    return todaySessionsCardimages[2];
  } else if (i % 2 == 0) {
    return todaySessionsCardimages[1];
  } else {
    return todaySessionsCardimages[0];
  }
}

Color getTextColorForYourMaterialsForLevelCard(int i) {
  if (i % 4 == 0) {
    return yourMaterialsForLevelsTextColors[3];
  } else if (i % 3 == 0) {
    return yourMaterialsForLevelsTextColors[2];
  } else if (i % 2 == 0) {
    return yourMaterialsForLevelsTextColors[1];
  } else {
    return yourMaterialsForLevelsTextColors[0];
  }
}

Color getCardColorForYourMaterialsForLevelCard(int i) {
  if (i % 4 == 0) {
    return yourMaterialsForLevelsCardColors[3];
  } else if (i % 3 == 0) {
    return yourMaterialsForLevelsCardColors[2];
  } else if (i % 2 == 0) {
    return yourMaterialsForLevelsCardColors[1];
  } else {
    return yourMaterialsForLevelsCardColors[0];
  }
}

Color getDoctorLevelsCardColor(int i) {
  if (i % 4 == 0) {
    return doctorLevelsCardColors[3];
  } else if (i % 3 == 0) {
    return doctorLevelsCardColors[2];
  } else if (i % 2 == 0) {
    return doctorLevelsCardColors[1];
  } else {
    return doctorLevelsCardColors[0];
  }
}

String getDoctorLevelsCardNumberImages(int i) {
  if (i % 4 == 0) {
    return doctorLevelsCardNumberImages[3];
  } else if (i % 3 == 0) {
    return doctorLevelsCardNumberImages[2];
  } else if (i % 2 == 0) {
    return doctorLevelsCardNumberImages[1];
  } else {
    return doctorLevelsCardNumberImages[0];
  }
}
