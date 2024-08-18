// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image/image.dart' as img;
// import 'package:path/path.dart' as path;
// import 'package:lock_doctors/core/common/widget/loader.dart';
// import 'package:lock_doctors/core/theme/app_pallete.dart';
// import 'package:lock_doctors/core/utils/show_snack_bar.dart';
// import 'package:uuid/uuid.dart';

// import '../../../../core/utils/check_face_in_photo.dart';
// import '../bloc/auth_bloc.dart';

// class FaceCaptureScreen extends StatefulWidget {
//   const FaceCaptureScreen({super.key});

//   @override
//   _FaceCaptureScreenState createState() => _FaceCaptureScreenState();
// }

// class _FaceCaptureScreenState extends State<FaceCaptureScreen>
//     with SingleTickerProviderStateMixin {
//   CameraController? _controller;
//   final List<File> _images = [];
//   final List<File> _acceptedImages = [];
//   bool _faceInBox = false;
//   File? captureImage;
//   File? checkFaceInBoxImage;
//   Uuid uuid = const Uuid();
//   double _progress = 0.0;
//   late Timer _timer;
//   final int _photoCount = 0;
//   final int _maxPhotos = 10; // يمكن تعديل العدد المناسب
//   bool _isTakingPhotos = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     _checkFaceInCircle();
//   }

//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     final frontCamera = cameras[0].lensDirection == CameraLensDirection.front
//         ? cameras[0]
//         : cameras[1];

//     _controller = CameraController(frontCamera, ResolutionPreset.medium);
//     await _controller!.initialize();

//     setState(() {});
//   }

//   void _checkFaceInCircle() {
//     _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
//       final xFile = await _controller!.takePicture();
//       final imagePath = xFile.path;
//       final imageFile = File(imagePath);
//       checkFaceInBoxImage = imageFile;
//       if (await checkFaceInPhotoToUser(checkFaceInBoxImage!, context)) {
//         _faceInBox = true;
//       } else {
//         _faceInBox = false;
//       }
//       setState(() {});
//     });
//   }

//   void _startTakingPhotos() {
//     setState(() {
//       _timer.cancel();
//       _isTakingPhotos = true;
//     });

//     if (_controller != null &&
//         _controller!.value.isInitialized &&
//         _photoCount < _maxPhotos) {
//       _takePicture();
//       _progress += 10;
//     }
//   }

//   void _stopTakingPhotos() {
//     _timer.cancel();
//     setState(() {
//       _isTakingPhotos = true;
//     });
//   }

//   Future<void> _takePicture() async {
//     final xFile = await _controller!.takePicture();
//     final imagePath = xFile.path;
//     final imageFile = File(imagePath);
//     captureImage = imageFile;

//     if (await checkFaceInPhoto(captureImage!, context)) {
//       _images.add(captureImage!);
//       setState(() {});
//       if (_images.length == 10) {
//         _isTakingPhotos = false;
//         context
//             .read<AuthBloc>()
//             .add(AuthSetStudFaceModel(image: _images, studId: "listOsama"));
//       } else {
//         _startTakingPhotos();
//       }
//     } else {
//       _faceInBox = false;
//       _isTakingPhotos = false;
//       _images.clear();
//       _progress = 0;
//       _checkFaceInCircle();
//       showSnackBar(context, "Please set your head in the frame");
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthSetModelSuccess) {
//             showSnackBar(context, "sucess");
//             _acceptedImages.add(captureImage!);
//           } else if (state is AuthFail) {
//             showSnackBar(context, state.message);
//           }
//         },
//         builder: (context, state) {
//           return SingleChildScrollView(
//             child: SizedBox(
//               height: size.height,
//               width: size.width,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: size.height * 0.05,
//                   ),
//                   _controller != null && _controller!.value.isInitialized
//                       ? Container(
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: _isTakingPhotos
//                                   ? AppPallete.transparentPerbel
//                                   : _faceInBox
//                                       ? AppPallete.primaryColor
//                                       : AppPallete.transparentRed),
//                           width: size.height / 3, // Adjust the width as needed
//                           height:
//                               size.height / 3, // Adjust the height as needed
//                           child: Padding(
//                             padding: EdgeInsets.all(size.width * 0.013),
//                             child: ClipOval(
//                               child: AspectRatio(
//                                 aspectRatio: 1 / 1,
//                                 child: CameraPreview(_controller!),
//                               ),
//                             ),
//                           ),
//                         )
//                       : const CircularProgressIndicator(),
//                   SizedBox(height: size.height * 0.05),
//                   _faceInBox
//                       ? _isTakingPhotos
//                           ? Column(
//                               children: [
//                                 SizedBox(
//                                   width: 200,
//                                   child: LinearProgressIndicator(
//                                     borderRadius: BorderRadius.circular(30),
//                                     value: _progress / 100,
//                                     minHeight: 20,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${_progress.toInt()}%',
//                                   style: const TextStyle(
//                                       fontSize: 20,
//                                       color: AppPallete.whiteColor),
//                                 ),
//                                 SizedBox(
//                                   height: size.height * 0.013,
//                                 ),
//                                 Text(
//                                   textAlign: TextAlign.center,
//                                   "Please set your head in the frame\n and move your face slowly to\n get the best performance",
//                                   style: TextStyle(
//                                       color: AppPallete.whiteColor,
//                                       fontSize: 11,
//                                       height: size.height * 0.002),
//                                 ),
//                               ],
//                             )
//                           : AnimatedOpacity(
//                               opacity: _faceInBox ? 1 : 0,
//                               duration: const Duration(seconds: 1),
//                               child: ElevatedButton(
//                                 onPressed:
//                                     _faceInBox ? _startTakingPhotos : () {},
//                                 child: const Text('Start Taking Photos'),
//                               ))
//                       : SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: size.height * 0.15,
//                                 ),
//                                 child: const Text(
//                                   "Note: if you want to get the best result \nplease follow the instructions \n \n    1-please set your head in the frame \n    2-move your face slowly \n    3-Keep your hand steady and do not make any \n    sudden movements when taking pictures\n    so as not to spoil their quality.",
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                     height: 1.4,
//                                     color: AppPallete.whiteColor,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                   // Expanded(
//                   //   child: ListView.builder(
//                   //     itemCount: _acceptedImages.length,
//                   //     itemBuilder: (context, index) {
//                   //       return Image.file(_acceptedImages[index]);
//                   //     },
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
