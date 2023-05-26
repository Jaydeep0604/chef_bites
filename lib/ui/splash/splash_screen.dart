import 'dart:async';
import 'package:chef_bites/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const splashScreen = "/splashscreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _controllerdown;
  Animation<Offset>? _animationDown;

  AnimationController? _controllerup;
  Animation<Offset>? _animationup;

  @override
  void initState() {
    super.initState();

    //bottom animation
    _controllerdown = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationDown = Tween<Offset>(
      begin: const Offset(0.0, 1),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllerdown!,
      curve: Curves.easeInCubic,
      // curve: Curves.easeOutBack,
    ));
    Future.delayed(const Duration(milliseconds: 0), () {
      _controllerdown!.forward();
    });

    // topanimation

    _controllerup = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationup = Tween<Offset>(
      begin: const Offset(
        0.0,
        -1.0,
      ),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllerup!,
      curve: Curves.easeInCubic,

      // reverseCurve: Curves.easeInOut
    ));
    Future.delayed(const Duration(milliseconds: 0), () {
      _controllerup!.forward();
    });
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(context,
          (MaterialPageRoute(builder: (context) => const LoginScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SlideTransition(
                      position: _animationup!,
                      child: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: SvgPicture.asset(
                                  "assets/images/top_circular_Rectangle.svg",
                                  fit: BoxFit.fill,
                                )),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    "assets/icons/logo 1.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    SlideTransition(
                      position: _animationDown!,
                      child: SizedBox(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: SvgPicture.asset(
                                    "assets/images/Bottom_Rectangle.svg")),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Opacity(
                                    opacity: 0.05,
                                    child: SvgPicture.asset(
                                      "assets/images/Ellipse.svg",
                                      color: Colors.black87,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  child: Image.asset(
                                    "assets/icons/bottom_logo.png",
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
