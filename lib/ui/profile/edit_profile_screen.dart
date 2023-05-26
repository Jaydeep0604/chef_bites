import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController? firstNameCtre, lastNameCtr, phoneCtr, emailCtr;
  @override
  void initState() {
    super.initState();
    firstNameCtre = TextEditingController(text: "Testfirstname");
    lastNameCtr = TextEditingController(text: "Testlastname");
    emailCtr = TextEditingController(text: "Testmail@gmail.com");
    phoneCtr = TextEditingController(text: "+91 9486 258 357");
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Edit Profile",
          isNeedLeading: false,
          isNeedAction: true,
          leadingIcon: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Transform.scale(
              scale: 0.7,
              child: SvgPicture.asset(
                "assets/icons/back.svg",
              ),
            ),
          ),
          action: GestureDetector(
            onTap: () {
             Navigator.pushNamedAndRemoveUntil(
                  context, Base.base, (route) => false);
            },
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/icons/home_icon.svg",
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: SizedBox(
          height: 40,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFE2951B),
                  Color(0xFFFFC56B),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                // stops: [1,1.1],
                tileMode: TileMode.repeated,
              ),
            ),
            child: TextButton(
                //style: TextButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Save Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      "assets/icons/drawer_profile.svg",
                      color: AppColors.whiteColor,
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                
                Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                       // color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Account Information",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: AppColors.notificationTitleColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              EditText(
                                controller: firstNameCtre,
                                textInputType: TextInputType.text,
                                hint: "First Name",
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/user.svg",
                                ),
                                inputformtters: [
                                  LengthLimitingTextInputFormatter(30),
                                  FilteringTextInputFormatter(
                                      RegExp(r'[a-zA-Z]'),
                                      allow: true),
                                  LengthLimitingTextInputFormatter(27)
                                ],
                                validator: (value) {
                                  if (value?.trimLeft().trimRight().isEmpty ??
                                      true) {
                                    return "Please enter Username";
                                  }
                                  if (value != null && value.length < 3) {
                                    return "Username must be minimum 3 characters";
                                  }
                                  return null;
                                },
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
                                  FilteringTextInputFormatter(
                                      RegExp(r'[a-zA-Z]'),
                                      allow: true),
                                  LengthLimitingTextInputFormatter(27)
                                ],
                                validator: (value) {
                                  if (value?.trimLeft().trimRight().isEmpty ??
                                      true) {
                                    return "Please enter Last Name";
                                  }

                                  return null;
                                },
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
                                validator: (value) {
                                  if (value?.trimLeft().trimRight().isEmpty ??
                                      true) {
                                    return "Please enter Phone number";
                                  }
                                  // if (value != null && value.length < 9) {
                                  //   return "Username must be minimum 3 characters";
                                  // }
                                  return null;
                                },
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
                                validator: (value) {
                                  if (value?.trim().isEmpty ?? true) {
                                    return "Please enter email address";
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value ?? "")) {
                                    return "Enter valid email address";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
