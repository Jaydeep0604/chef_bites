import 'package:chef_bites/bloc/guest_bloc/guest_bloc.dart';
import 'package:chef_bites/bloc/guest_bloc/guest_event.dart';
import 'package:chef_bites/bloc/guest_bloc/guest_state.dart';
import 'package:chef_bites/ui/login/login_screen.dart';
import 'package:chef_bites/ui/verification/verification_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // TextEditingController phoneCtr = TextEditingController(text: "**** *** 859");
  // TextEditingController emailCtr =
  //     TextEditingController(text: "******xyz@mail.com");
  late GuestBloc guestBloc;

  @override
  void initState() {
    super.initState();
    guestBloc = context.read<GuestBloc>();
    guestBloc.add(fetchGuestEvent());
  }

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
        body: SafeArea(
          child: BlocBuilder<GuestBloc, GuestState>(
            builder: (context, state) {
              if (state is InitialGuestState || state is LoadingGuestState) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                );
              }
              if (state is LoadedGuestState) {
                ScrollConfiguration(
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
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 50),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 122,
                                          width: 122,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            child: Image.asset(
                                              "assets/icons/dish.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 90),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Forgot \nPassword",
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 106),
                                            child: Text(
                                              "Select which contact details should we use to reset your password",
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
                                    ForgetPhoneText(
                                      // controller: phoneCtr,
                                      textInputType: TextInputType.number,
                                      lable: "Via sms:",
                                      prefixIcon: SvgPicture.asset(
                                        "assets/icons/phone.svg",
                                      ),
                                      inputformtters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(13)
                                      ],

                                      // validator: (value) {
                                      //   if (value?.trimLeft().trimRight().isEmpty ??
                                      //       true) {
                                      //     return "Please enter Username";
                                      //   }
                                      //   if (value != null && value.length < 3) {
                                      //     return "Username must be minimum 3 characters";
                                      //   }
                                      //   return null;
                                      // },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ForgetPhoneText(
                                      // controller: emailCtr,
                                      lable: "Via email:",
                                      // controller: emailCtr,
                                      prefixIcon: Transform.scale(
                                        scale: 0.9,
                                        child: SvgPicture.asset(
                                          "assets/icons/email.svg",
                                        ),
                                      ),
                                      inputformtters: [
                                        LengthLimitingTextInputFormatter(60),
                                        FilteringTextInputFormatter.deny(" "),
                                        FilteringTextInputFormatter.deny("[]"),
                                        FilteringTextInputFormatter.deny("["),
                                        FilteringTextInputFormatter.deny("]"),
                                        FilteringTextInputFormatter.deny("^"),
                                        FilteringTextInputFormatter.deny(""),
                                        FilteringTextInputFormatter.deny("`"),
                                        FilteringTextInputFormatter.deny("/"),
                                        // FilteringTextInputFormatter.deny("\"),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9a-zA-z._@]')),
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r"/"))
                                      ],
                                      // validator: (value) {
                                      //   if (value?.trim().isEmpty ?? true) {
                                      //     return "Please enter email address";
                                      //   } else if (!RegExp(
                                      //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      //       .hasMatch(value ?? "")) {
                                      //     return "Enter valid email address";
                                      //   }
                                      //   return null;
                                      // },
                                    ),
                                    const SizedBox(
                                      height: 50,
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
                                                        const VerificationScreen()));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Reset Password",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              SvgPicture.asset(
                                                  "assets/icons/forget_submit.svg"),
                                            ],
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Remember password? "),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginScreen()));
                                            },
                                            child: const Text(
                                              "Log In",
                                              style: TextStyle(
                                                  color: Colors.amber),
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
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
