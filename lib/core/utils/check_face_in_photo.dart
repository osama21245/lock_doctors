// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:lock_doctors/core/utils/show_snack_bar.dart';
// import "package:image/image.dart" as img;

// Future<bool> checkFaceInPhoto(
//   File image,
//   BuildContext context,
// ) async {
//   final faceDetector = FaceDetector(
//     options: FaceDetectorOptions(
//       performanceMode: FaceDetectorMode.fast,
//     ),
//   );
//   final visionImage = InputImage.fromFile(image);
//   final detectedFaces = await faceDetector.processImage(visionImage);

//   // Read the image to get its dimensions
//   final bytes = await image.readAsBytes();
//   final img.Image? image = img.decodeImage(bytes);

//   if (image == null) {
//     showSnackBar(context, "Invalid image file");
//     return false;
//   }
//   if (detectedFaces.isNotEmpty) {
//     final imageWidth = image.width;
//     final imageHeight = image.height;
//     final imageArea = imageWidth * imageHeight;

//     final face = detectedFaces.first;
//     final faceBoundingBox = face.boundingBox;
//     final faceWidth = faceBoundingBox.width;
//     final faceHeight = faceBoundingBox.height;
//     final faceArea = faceWidth * faceHeight;

//     final facePercentage = (faceArea / imageArea) * 100;
//     print(facePercentage);
//     if (facePercentage >= 10) {
//       showSnackBar(context, "Valid Image");
//       return true;
//     } else {
//       showSnackBar(context, "Face does not take up 60% of the image");
//       return false;
//     }
//   } else {
//     showSnackBar(context, "Please adjust your face in front of the camera ");

//     return false;
//   }
// }

// Future<bool> checkFaceInPhotoToUser(
//   File image,
//   BuildContext context,
// ) async {
//   final faceDetector = FaceDetector(
//     options: FaceDetectorOptions(
//       performanceMode: FaceDetectorMode.fast,
//     ),
//   );
//   final visionImage = InputImage.fromFile(image);
//   final detectedFaces = await faceDetector.processImage(visionImage);

//   // Read the image to get its dimensions
//   final bytes = await image.readAsBytes();
//   final img.Image? image = img.decodeImage(bytes);

//   if (image == null) {
//     showSnackBar(context, "Invalid image file");
//     return false;
//   }
//   if (detectedFaces.isNotEmpty) {
//     final imageWidth = image.width;
//     final imageHeight = image.height;
//     final imageArea = imageWidth * imageHeight;

//     final face = detectedFaces.first;
//     final faceBoundingBox = face.boundingBox;
//     final faceWidth = faceBoundingBox.width;
//     final faceHeight = faceBoundingBox.height;
//     final faceArea = faceWidth * faceHeight;

//     final facePercentage = (faceArea / imageArea) * 100;
//     print(facePercentage);
//     if (facePercentage >= 15) {
//       return true;
//     } else {
//       return false;
//     }
//   } else {
//     return false;
//   }
// }
