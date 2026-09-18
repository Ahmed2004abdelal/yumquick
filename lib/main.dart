import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/Routing/app_routing.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/di/dependency_injection.dart';
import 'package:yumquick/core/helper/constants.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/shared_pref_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    setupGetIt(),
    heckIfLoggedInUser(),
    GoogleSignIn.instance.initialize(
      serverClientId: '865071385903-lmmlmdf2d5kklor50qpb2c3h2rio3obg.apps.googleusercontent.com',
    ),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        onGenerateRoute: AppRouting.getRouting,
        initialRoute: isLoggedInUser ? Routes.home : Routes.login,
      ),
    );
  }
}

Future<void> heckIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  log(userToken ?? 'No token found');
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
