import 'dart:math';

import 'package:chef_bites/repo/guest_repo.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/forget_password/forget_password_screen.dart';
import 'package:chef_bites/ui/register/register_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/cb_toast.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/guest_bloc/guest_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const loginScreen = "/loginscreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  bool _obsecureText = true;
  void _toggleObscured() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.offwhiteColor,
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
                  SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 90, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Welcome!",
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Login to continue",
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 20, top: 40),
                                  child: Image.asset(
                                    "assets/icons/store.png",
                                    fit: BoxFit.fill,
                                    height: 110,
                                    width: 110,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          // key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, bottom: 20),
                            child: Column(
                              children: [
                                EditText(
                                  hint: "Enter Email Address",
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
                                  height: 10,
                                ),
                                EditText(
                                  controller: passwordCtr,
                                  hint: "Enter Password",
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
                                  //   if (value == "" ||
                                  //       (value?.trim().isEmpty ?? true)) {
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
                                                "assets/icons/hide.png")
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
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BlocProvider(
                                                  create: (context) =>
                                                      GuestBloc(repo: GuestImpl()),
                                                  child: ForgetPasswordScreen(),
                                                )));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 0.2),
                                    alignment: Alignment.topRight,
                                    child: Text('Forgot Password?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                // fontFamily: KSMFontFamily.robotoRgular,
                                                color: const Color.fromARGB(
                                                    255, 239, 207, 0))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
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
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        if (validateLogin()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Base()));
                                          CbToast.instance.successMessage(
                                              context, "Login successfull");
                                        }
                                        // if (_formKey.currentState!
                                        //     .validate()) {}
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Login",
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: const BorderSide(
                                                  color: Colors.amber))),
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Base()));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Continue as Guest ",
                                            style:
                                                TextStyle(color: Colors.amber),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SvgPicture.asset(
                                            "assets/icons/login_submit.svg",
                                            color: Colors.amber,
                                          ),
                                        ],
                                      )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InteractiveViewer(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Expanded(child: Divider()),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(),
                                          child: Container(
                                              child: Text(
                                            "OR",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColors.primaryColor
                                                    .withOpacity(0.5),
                                                fontSize: 14),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Expanded(child: Divider()),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade200),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/google.svg",
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("Login with Google",
                                            style: TextStyle(
                                                color: Colors.black38)),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade200),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/facebook.svg",
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("Login with Facebook",
                                            style: TextStyle(
                                                color: Colors.black38)),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade200),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/apple.svg",
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("Login with Apple",
                                            style: TextStyle(
                                                color: Colors.black38)),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don’t have an account? "),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterScreen()));
                                        },
                                        child: const Text(
                                          "Sign up",
                                          style: TextStyle(color: Colors.amber),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateLogin() {
    if (emailCtr.text == "" || emailCtr.text.isEmpty) {
      CbToast.instance.showErrorMessage(context, "Please enter email address");
      return false;
    } else if (!RegExp(r"^(?:\d{10}|\w+@\w+\.\w{2,3})$")
        .hasMatch(emailCtr.text)) {
      CbToast.instance.showErrorMessage(context, "Invalid email address");
      return false;
    } else if (passwordCtr.text == "" || passwordCtr.text.isEmpty) {
      CbToast.instance.showErrorMessage(context, "please enter password");
      return false;
    } else {
      return true;
    }
  }
}
// import 'package:chef_bites/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:country_code_picker/country_code_picker.dart';

// class EditText extends StatefulWidget {
//   TextInputType? textInputType;
//   String? hint;
//   String? lable;
//   String? name;
//   int? maxLength;
//   String? Function(String?)? validator;
//   TextInputAction? textInputAction;
//   void Function()? onEditingComplete;
//   Widget? suffixIcon;
//   Widget? prefixIcon;
//   bool obsecureText;
//   bool readOnly;
//   bool enabled;
//   Color? color;
//   bool? filled;

//   TextEditingController? controller;
//   List<TextInputFormatter>? inputformtters;
//   bool autoFoucs;

//   EditText(
//       {Key? key,
//       this.textInputType,
//       this.obsecureText = false,
//       this.readOnly = false,
//       this.suffixIcon,
//       this.prefixIcon,
//       this.hint,
//       this.lable,
//       this.name,
//       this.textInputAction,
//       this.validator,
//       this.controller,
//       this.inputformtters,
//       this.enabled = true,
//       this.maxLength,
//       this.onEditingComplete,
//       this.autoFoucs = false,
//       this.color,
//       this.filled})
//       : super(key: key);

//   @override
//   State<EditText> createState() => _EditTextState();
// }

// class _EditTextState extends State<EditText> {
//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicHeight(
//       child: Container(
//         decoration: BoxDecoration(
//             color:
//                 // widget.filled == true && widget.color == ""
//                 //     ? AppColors.offwhiteColor
//                 //     : widget.color,
//                 widget.filled == true && widget.color != null
//                     ? widget.color
//                     : AppColors.offwhiteColor,
//             borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               width: 10,
//             ),
//             SizedBox(
//               height: 20,
//               width: 20,
//               child: widget.prefixIcon,
//             ),
//             const VerticalDivider(
//               color: Colors.black45,
//               indent: 8,
//               endIndent: 8,
//               thickness: 1,
//             ),
//             Expanded(
//               child: TextFormField(
//                 controller: widget.controller,
//                 validator: widget.validator,
//                 onEditingComplete: widget.onEditingComplete,
//                 textInputAction: widget.textInputAction,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 keyboardType: widget.textInputType,
//                 obscureText: widget.obsecureText,
//                 readOnly: widget.readOnly,
//                 cursorColor: Colors.blue,
//                 inputFormatters: widget.inputformtters,
//                 enabled: widget.enabled,
//                 maxLength: widget.maxLength,
//                 autofocus: widget.autoFoucs,
//                 toolbarOptions: const ToolbarOptions(
//                   copy: true,
//                   cut: true,
//                   paste: false,
//                   selectAll: false,
//                 ),
//                 style: const TextStyle(
//                   fontSize: 14, //fontFamily: KSMFontFamily.robotoRgular
//                 ),
//                 decoration: InputDecoration(
//                     suffixIcon: widget.suffixIcon,
//                     labelText: widget.lable,
//                     errorStyle: Theme.of(context)
//                         .textTheme
//                         .caption
//                         ?.copyWith(color: Colors.red),
//                     helperStyle: Theme.of(context).textTheme.subtitle1,
//                     hintStyle: Theme.of(context).textTheme.caption,
//                     hintText: widget.hint,
//                     // filled: true,
//                     // border: InputBorder.none,
//                     contentPadding: const EdgeInsets.only(left: 10, right: 10),
//                     label: widget.name != null ? Text(widget.name ?? "") : null,
//                     disabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none),
//                     focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none),
//                     errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
