import 'package:chef_bites/ui/login/login_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 247),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: SvgPicture.asset("assets/icons/back.svg"),
              )),
        ),
        body: ScrollConfiguration(
          behavior: NoGlow(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                  SizedBox(
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 20, top: 50),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 122,
                              width: 127,
                              child: SvgPicture.asset(
                                "assets/icons/forget_top_logo.svg",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 90),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Verification \nCode",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 106),
                                child: Text(
                                  "We have sent 4-digit code to \n+91 8457 854 856 please enter them below",
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpInput(_fieldOne, true), // auto focus
                            OtpInput(_fieldTwo, false),
                            OtpInput(_fieldThree, false),
                            OtpInput(_fieldFour, false)
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.primaryColor,
                                    Color(0xFFFFC56B),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  // stops: [1,1.1],
                                  tileMode: TileMode.repeated,
                                ),
                              ),
                          child: TextButton(
                              // style: TextButton.styleFrom(
                              //     backgroundColor: Colors.amber),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Reset Password",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SvgPicture.asset(
                                      "assets/icons/otp_btn_icon.svg"),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don’t receive a code? "),
                            TextButton(
                                onPressed: () {
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const LoginScreen()));
                                },
                                child: const Text(
                                  "Resend",
                                  style: TextStyle(color: Colors.amber),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
