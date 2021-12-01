import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/root.dart';
import 'package:ifplant_app/app/route/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Get.off(() => const Root(),
          duration: const Duration(milliseconds: 1200),
          transition: Transition.fadeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/splash.png', fit: BoxFit.cover);
  }
}
