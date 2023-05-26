import 'package:chef_bites/ui/login/login_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/cb_toast.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  CountryCode? code;
  GlobalKey<CountryCodePickerState> _countryCodePickerKey = GlobalKey();
  bool _obsecureText = true;
  bool _obsecureConPassText = true;
  bool isChecked = false;
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController confirmPasswordCtr = TextEditingController();
  // TextEditingController referCodeCtr;
  void _toggleObscured() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obsecureConPassText = !_obsecureConPassText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                                  const EdgeInsets.only(right: 20, top: 67),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: 97,
                                  width: 97,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 97,
                                        width: 97,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey.shade100,
                                          child: SvgPicture.asset(
                                            "assets/icons/user.svg",
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(70),
                                              color: AppColors.primaryColor),
                                          height: 34,
                                          width: 34,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: SvgPicture.asset(
                                                "assets/icons/cam.svg",
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
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
                                    "Create Account",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Register Yourself",
                                    style: TextStyle(fontSize: 14),
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
                        padding: const EdgeInsets.only(
                            left: 18, right: 18, bottom: 20),
                        child: Column(
                          children: [
                            EditText(
                              controller: firstNameCtr,
                              textInputType: TextInputType.text,
                              hint: "First Name",
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/user.svg",
                              ),
                              inputformtters: [
                                LengthLimitingTextInputFormatter(30),
                                FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'),
                                    allow: true),
                                LengthLimitingTextInputFormatter(27)
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
                              height: 7,
                            ),
                            EditText(
                              controller: lastNameCtr,
                              textInputType: TextInputType.text,
                              hint: "Last Name",
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/user.svg",
                              ),
                              inputformtters: [
                                LengthLimitingTextInputFormatter(30),
                                FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'),
                                    allow: true),
                                LengthLimitingTextInputFormatter(27)
                              ],
                              // validator: (value) {
                              //   if (value?.trimLeft().trimRight().isEmpty ??
                              //       true) {
                              //     return "Please enter Last Name";
                              //   }

                              //   return null;
                              // },
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            EditText(
                              hint: "Email Address",
                              controller: emailCtr,
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
                                FilteringTextInputFormatter.deny(RegExp(r"/"))
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
                              height: 7,
                            ),
                            EditPhoneText(
                              controller: phoneCtr,
                              textInputType: TextInputType.number,
                              hint: "Phone Number",
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/dail.svg",
                              ),
                              inputformtters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(13)
                              ],
                              phone: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Container(
                                      //height: 47,
                                      // width: 80,
                                      padding: EdgeInsets.only(top: 1),
                                      // decoration: BoxDecoration(
                                      //     borderRadius:
                                      //         BorderRadius.circular(10)),
                                      child: CountryCodePicker(
                                        key: _countryCodePickerKey,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        // barrierColor: Colors.black.withOpacity(0.2),
                                        onChanged: (CountryCode codeValue) {
                                          setState(() {
                                            code = codeValue;
                                          });
                                        },
                                        searchDecoration: InputDecoration(
                                          hintText:
                                              "Search country code (Past selected ${code == null ? "+1" : code})",
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 11),
                                        ),
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                        backgroundColor:
                                            Color.fromARGB(197, 0, 0, 0),
                                        initialSelection: 'US',
                                        boxDecoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                        ),
                                        favorite: ['+1', 'US'],
                                        showCountryOnly: false,
                                        showDropDownButton: false,
                                        showFlag: false,
                                        dialogSize: MediaQuery.of(context).size,
                                        dialogBackgroundColor:
                                            AppColors.pholdeBackgroundColor,
                                        showOnlyCountryWhenClosed: false,
                                        alignLeft: false,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _countryCodePickerKey.currentState
                                            ?.showCountryCodePickerDialog();
                                        ;
                                      },
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.notificationTitleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                              height: 7,
                            ),
                            EditText(
                              controller: passwordCtr,
                              hint: "Password",
                              prefixIcon: Transform.scale(
                                scale: 0.9,
                                child: SvgPicture.asset(
                                  "assets/icons/lock.svg",
                                ),
                              ),
                              obsecureText: _obsecureText,
                              textInputType: TextInputType.visiblePassword,
                              inputformtters: [
                                FilteringTextInputFormatter.deny(' '),
                                LengthLimitingTextInputFormatter(16)
                              ],
                              // validator: (value) {
                              //   if (value == "" || (value?.trim().isEmpty ?? true)) {
                              //     return "Please enter password";
                              //   }
                              //   return null;
                              // },
                              suffixIcon: GestureDetector(
                                onTap: _toggleObscured,
                                child: Transform.scale(
                                  scale: 0.5,
                                  child: ImageIcon(
                                    _obsecureText
                                        ? const AssetImage(
                                            "assets/icons/hide.png",
                                          )
                                        : const AssetImage(
                                            "assets/icons/view.png",
                                          ),
                                    size: 12,
                                    // color: AppColors.button_color,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            EditText(
                              controller: confirmPasswordCtr,
                              hint: "Confirm Password",
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/lock.svg",
                              ),
                              obsecureText: _obsecureConPassText,
                              textInputType: TextInputType.visiblePassword,
                              inputformtters: [
                                FilteringTextInputFormatter.deny(' '),
                                LengthLimitingTextInputFormatter(16)
                              ],
                              suffixIcon: GestureDetector(
                                onTap: _toggleObscured2,
                                child: Transform.scale(
                                  scale: 0.5,
                                  child: ImageIcon(
                                    _obsecureConPassText
                                        ? const AssetImage(
                                            "assets/icons/hide.png",
                                          )
                                        : const AssetImage(
                                            "assets/icons/view.png",
                                          ),
                                    size: 12,
                                    // color: AppColors.button_color,
                                  ),
                                ),
                              ),
                              // validator: (val) {
                              //   if (val!.isEmpty)
                              //     return 'Please Enter Confirm Password';
                              //   if (val != passwordctr.text)
                              //     return 'Password Not Match';
                              //   return null;
                              // }
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            EditText(
                              // controller:referCodeCtr,
                              textInputType: TextInputType.text,
                              hint: "Refer Code (Optional)",
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/refer.svg",
                              ),
                              inputformtters: [
                                LengthLimitingTextInputFormatter(10),
                                // FilteringTextInputFormatter(
                                //     RegExp(r'[a-zA-Z]'),
                                //     allow: true),
                              ],
                              // validator: (value) {
                              //   if (value?.trimLeft().trimRight().isEmpty ??
                              //       true) {
                              //     return "Please enter Last Name";
                              //   }

                              //   return null;
                              // },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: isChecked,
                                        checkColor: Colors.white,
                                        activeColor: AppColors.primaryColor,
                                        onChanged: (value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                          Border.all(
                                              color: AppColors.primaryColor);
                                        },
                                        side: const BorderSide(
                                            color: AppColors.primaryColor),
                                      ),
                                      const Text(
                                        'I agree',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      // Fluttertoast.showToast(
                                      //     msg:
                                      //         "Terms and Condition Page",
                                      //     toastLength:
                                      //         Toast.LENGTH_SHORT,
                                      //     gravity: ToastGravity.BOTTOM,
                                      //     timeInSecForIosWeb: 1,
                                      //     backgroundColor:
                                      //         Color.fromARGB(
                                      //             277, 219, 0, 0),
                                      //     textColor: Colors.white,
                                      //     fontSize: 16.0);
                                    }),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 2,
                                      ),
                                      //alignment: Alignment.topRight,

                                      child: Text('Terms and Condition',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  //fontFamily: KSMFontFamily.robotoRgular,
                                                  color: AppColors.primaryColor,
                                                  fontSize: 14)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (() {}),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 2,
                                      ),
                                      //alignment: Alignment.topRight,
                                      child: Text('&',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  //fontFamily: KSMFontFamily.robotoRgular,
                                                  color: Colors.black,
                                                  fontSize: 14)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      // Fluttertoast.showToast(
                                      //     msg: "Privacy Policy Page",
                                      //     toastLength:
                                      //         Toast.LENGTH_SHORT,
                                      //     gravity: ToastGravity.BOTTOM,
                                      //     timeInSecForIosWeb: 1,
                                      //     backgroundColor:
                                      //         Color.fromARGB(
                                      //             277, 219, 0, 0),
                                      //     textColor: Colors.white,
                                      //     fontSize: 16.0);
                                    }),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 2,
                                      ),
                                      //alignment: Alignment.topRight,
                                      child: Text(
                                        'Privacy Policy',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                //fontFamily: KSMFontFamily.robotoRgular,
                                                color: AppColors.primaryColor,
                                                fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
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
                                    if (validate1()) {
                                      if (isChecked == false) {
                                        CbToast.instance.simpleMessage(context,
                                            "Please agree with the terms & Conditions and privacy policy");
                                      }
                                    }
                                    ;
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Sign Up",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SvgPicture.asset(
                                          "assets/icons/login_submit.svg"),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
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

  bool validate1() {
    if (firstNameCtr.text == "" || firstNameCtr.text.isEmpty) {
      CbToast.instance.simpleMessage(context, "Please enter first name");
      return false;
    } else if (lastNameCtr.text == "" || lastNameCtr.text.isEmpty) {
      CbToast.instance.simpleMessage(context, "Please enter last name");
      return false;
    } else if (emailCtr.text == "" || emailCtr.text.isEmpty) {
      CbToast.instance.simpleMessage(context, "Please enter email address");
      return false;
    } else if (phoneCtr.text == "" || phoneCtr.text.isEmpty) {
      CbToast.instance.simpleMessage(context, "Please enter phone");
      return false;
    } else if (passwordCtr.text == "" || passwordCtr.text.isEmpty) {
      CbToast.instance.simpleMessage(context, "Please enter password");
      return false;
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(passwordCtr.text)) {
      CbToast.instance
          .simpleMessage(context, "Password should match given criteria");
      return false;
    } else if (confirmPasswordCtr.text == "" ||
        confirmPasswordCtr.text.isEmpty) {
      CbToast.instance.simpleMessage(context, "Please enter confirm password");
      return false;
    } else if ((passwordCtr.text != "" || passwordCtr.text.isNotEmpty) &&
        (confirmPasswordCtr.text != "" || confirmPasswordCtr.text.isNotEmpty)) {
      if (passwordCtr.text != confirmPasswordCtr.text) {
        CbToast.instance.simpleMessage(
            context, "Password should match with confirm password");
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
