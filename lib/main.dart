import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumquick/env.dart';

import 'core/Routing/app_routing.dart';
import 'core/Routing/routes.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper/constants.dart';
import 'core/helper/shared_pref_helper.dart';

import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  await checkIfLoggedInUser();
  Stripe.publishableKey = Env.stripePublishableKey;
  await Stripe.instance.applySettings();

  await GoogleSignIn.instance.initialize(serverClientId: Env.serverClientId);

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
        initialRoute: isLoggedInUser ? Routes.bottomNavBar : Routes.login,
      ),
    );
  }
}

Future<void> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  log(userToken.isEmpty ? 'No token found' : userToken);
  if (userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
