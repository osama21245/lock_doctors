import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lock_doctors/core/routing/app_router.dart';
import 'package:lock_doctors/core/theme/theme_data.dart';

import 'package:lock_doctors/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:lock_doctors/features/home/presentation/bloc/home_bloc.dart';

import 'package:lock_doctors/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';

import 'features/student/presentation/bloc/student_bloc.dart';
import 'features/student/presentation/screens/search_for_student_screen.dart';
import 'features/student/presentation/screens/student_info_for_serch_screen.dart';
import 'features/student/presentation/screens/student_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await ScreenUtil.ensureScreenSize();
  print('User: development');

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocator<DoctorBloc>()),
        BlocProvider(create: (_) => serviceLocator<HomeBloc>()),
        BlocProvider(create: (_) => serviceLocator<StudentBloc>()),
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      ],
      child: MyApp(
        appRouter: AppRouter(),
      )));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    if (mounted) {
      context.read<AuthBloc>().add(AuthGetUserDataFromLocalStorage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(398.94, 863.83),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.appDarkTheme,
        home: BlocBuilder<AppUserCubit, AppUserState>(
          builder: (context, state) {
            if (state is AppUserIsLogIn) {
              return const SearchForStudentScreen();
            } else {
              return const SearchForStudentScreen();
            }
          },
        ),
      ),
    );
  }
}
