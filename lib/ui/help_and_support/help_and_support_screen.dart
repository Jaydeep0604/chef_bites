import 'package:chef_bites/model/chat_message_model.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);
  static const helpAndSupportScreen = '/helpandsupportscreen';

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Reference site about Lorem Ipsum, giving",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Reference site about Lorem Ipsum, giving",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Reference site about Lorem Ipsum, giving",
        messageType: "sender"),
    ChatMessage(
        messageContent:
            "Reference site about Lorem Ipsum, giving Reference site about Lorem Ipsum, giving Reference site about Lorem Ipsum, giving Reference site about Lorem Ipsum, ",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Reference site about Lorem Ipsum, giving",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Reference site about Lorem Ipsum, giving",
        messageType: "receiver"),
  ];

  TextEditingController messageCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Help & Support",
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
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  primary: false,
                  reverse: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (messages[index].messageType == "receiver"
                                ? AppColors.primaryColor
                                : AppColors.offwhiteColor),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages[index].messageContent,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.offwhiteColor),
                child: Row(
                  children: [
                    Expanded(
                      child: MessageEditText(
                        controller: messageCtr,
                        hint: "Type your msg here.....",
                        filled: true,
                        color: AppColors.offwhiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          messageCtr.clear();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(11),
                          child: SvgPicture.asset(
                              "assets/icons/message_share.svg"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
