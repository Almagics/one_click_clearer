import 'dart:async';

import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer;

  _startDelay(){

    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.loginRoute);

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,

      body:  Center(child: Image(image: const AssetImage(ImageAssets.splashLogo),height: MediaQuery.of(context).size.height,fit: BoxFit.fill,)),


    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
