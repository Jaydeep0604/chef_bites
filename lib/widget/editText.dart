import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';

class EditText extends StatefulWidget {
  TextInputType? textInputType;
  String? hint;
  String? lable;
  String? name;
  int? maxLength;
  // int? maxLine;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function()? onEditingComplete;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obsecureText;
  bool readOnly;
  bool enabled;
  Color? color;
  bool? filled;

  TextEditingController? controller;
  List<TextInputFormatter>? inputformtters;
  bool autoFoucs;

  EditText(
      {Key? key,
      this.textInputType,
      this.obsecureText = false,
      this.readOnly = false,
      this.suffixIcon,
      this.prefixIcon,
      this.hint,
      this.lable,
      this.name,
      this.textInputAction,
      this.validator,
      this.controller,
      this.inputformtters,
      this.enabled = true,
      this.maxLength,
      // this.maxLine,
      this.onEditingComplete,
      this.autoFoucs = false,
      this.color,
      this.filled})
      : super(key: key);

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: widget.filled == true && widget.color != null
                  ? widget.color
                  : AppColors.offwhiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              if (widget.prefixIcon != null)
              SizedBox(
                height: 20,
                width: 20,
                child: widget.prefixIcon,
              ),
              if (widget.prefixIcon != null)
                const VerticalDivider(
                  color: Colors.black45,
                  indent: 8,
                  endIndent: 8,
                  thickness: 1,
                ),
              Expanded(
                child: TextFormField(
                  // maxLines: widget.maxLine,
                  controller: widget.controller,
                  validator: widget.validator,
                  onEditingComplete: widget.onEditingComplete,
                  textInputAction: widget.textInputAction,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: widget.textInputType,
                  obscureText: widget.obsecureText,
                  readOnly: widget.readOnly,
                  cursorColor: Colors.blue,
                  inputFormatters: widget.inputformtters,
                  enabled: widget.enabled,
                  maxLength: widget.maxLength,
                  autofocus: widget.autoFoucs,
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    cut: true,
                    paste: false,
                    selectAll: false,
                  ),
                  style: const TextStyle(
                    fontSize: 14, //fontFamily: KSMFontFamily.robotoRgular
                  ),
                  decoration: InputDecoration(
                      suffixIcon: widget.suffixIcon,
                      labelText: widget.lable,
                      errorStyle: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: Colors.red),
                      helperStyle: Theme.of(context).textTheme.subtitle1,
                      hintStyle: Theme.of(context).textTheme.caption,
                      hintText: widget.hint,
                      // filled: true,
                      // border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 10, right: 10),
                      label: widget.name != null ? Text(widget.name ?? "") : null,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditPhoneText extends StatefulWidget {
  TextInputType? textInputType;
  String? hint;
  String? lable;
  Widget? phone;
  String? name;
  int? maxLength;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function()? onEditingComplete;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obsecureText;
  bool readOnly;
  bool enabled;
  Color? color;
  bool? filled;

  TextEditingController? controller;
  List<TextInputFormatter>? inputformtters;
  bool autoFoucs;

  EditPhoneText(
      {Key? key,
      this.textInputType,
      this.obsecureText = false,
      this.readOnly = false,
      this.suffixIcon,
      this.prefixIcon,
      this.hint,
      this.lable,
      this.phone,
      this.name,
      this.textInputAction,
      this.validator,
      this.controller,
      this.inputformtters,
      this.enabled = true,
      this.maxLength,
      this.onEditingComplete,
      this.autoFoucs = false,
      this.color,
      this.filled})
      : super(key: key);

  @override
  State<EditPhoneText> createState() => _EditPhoneTextState();
}

class _EditPhoneTextState extends State<EditPhoneText> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
            color: widget.filled == true && widget.color != null
                ? widget.color
                : AppColors.offwhiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: widget.prefixIcon,
            ),
            const VerticalDivider(
              color: Colors.black45,
              indent: 8,
              endIndent: 8,
              thickness: 1,
            ),
            Container(
              child: widget.phone,
            ),
            // ignore: unrelated_type_equality_checks
            if (widget.phone != null )
             VerticalDivider(
                color: Colors.black45,
                indent: 12,
                endIndent: 12,
                thickness: 1,
              ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                onEditingComplete: widget.onEditingComplete,
                textInputAction: widget.textInputAction,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: widget.textInputType,
                obscureText: widget.obsecureText,
                readOnly: widget.readOnly,
                cursorColor: Colors.blue,
                inputFormatters: widget.inputformtters,
                enabled: widget.enabled,
                maxLength: widget.maxLength,
                autofocus: widget.autoFoucs,
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: false,
                  selectAll: false,
                ),
                style: const TextStyle(
                  fontSize: 14, //fontFamily: KSMFontFamily.robotoRgular
                ),
                decoration: InputDecoration(
                    suffixIcon: widget.suffixIcon,
                    labelText: widget.lable,
                    errorStyle: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Colors.red),
                    helperStyle: Theme.of(context).textTheme.subtitle1,
                    hintStyle: Theme.of(context).textTheme.caption,
                    hintText: widget.hint,
                    // filled: true,
                    // border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10, right: 10),
                    label: widget.name != null ? Text(widget.name ?? "") : null,
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgetPhoneText extends StatefulWidget {
  TextInputType? textInputType;
  String? hint;
  String? lable;
  Widget? phone;
  String? name;
  int? maxLength;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function()? onEditingComplete;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obsecureText;
  bool readOnly;
  bool enabled;
  Color? color;
  bool? filled;
  TextEditingController? controller;
  List<TextInputFormatter>? inputformtters;
  bool autoFoucs;

  ForgetPhoneText(
      {Key? key,
      this.textInputType,
      this.obsecureText = false,
      this.readOnly = false,
      this.suffixIcon,
      this.prefixIcon,
      this.hint,
      this.lable,
      this.phone,
      this.name,
      this.textInputAction,
      this.validator,
      this.controller,
      this.inputformtters,
      this.enabled = true,
      this.maxLength,
      this.onEditingComplete,
      this.autoFoucs = false,
      this.color,
      this.filled})
      : super(key: key);

  @override
  State<ForgetPhoneText> createState() => _ForgetPhoneTextState();
}

class _ForgetPhoneTextState extends State<ForgetPhoneText> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
            color: widget.filled == true && widget.color != null
                ? widget.color
                : AppColors.offwhiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: widget.prefixIcon,
            ),
            const VerticalDivider(
              color: Colors.black45,
              indent: 8,
              endIndent: 8,
              thickness: 1,
            ),
            Container(
              child: widget.phone,
            ),
            if (widget.phone == true)
              const VerticalDivider(
                color: Colors.black45,
                indent: 12,
                endIndent: 12,
                thickness: 1,
              ),
            Expanded(
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextFormField(
                    controller: widget.controller,
                    validator: widget.validator,
                    onEditingComplete: widget.onEditingComplete,
                    textInputAction: widget.textInputAction,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: widget.textInputType,
                    obscureText: widget.obsecureText,
                    readOnly: widget.readOnly,
                    cursorColor: Colors.blue,
                    inputFormatters: widget.inputformtters,
                    enabled: widget.enabled,
                    maxLength: widget.maxLength,
                    autofocus: widget.autoFoucs,
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: true,
                      paste: false,
                      selectAll: false,
                    ),
                    style: const TextStyle(
                      fontSize: 14, //fontFamily: KSMFontFamily.robotoRgular
                    ),
                    decoration: InputDecoration(
                        suffixIcon: widget.suffixIcon,
                        labelText: widget.lable,
                        errorStyle: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: Colors.red),
                        helperStyle: Theme.of(context).textTheme.subtitle1,
                        hintStyle: Theme.of(context).textTheme.caption,
                        hintText: widget.hint,
                        // filled: true,
                        // border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        label: widget.name != null
                            ? Text(widget.name ?? "")
                            : null,
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MessageEditText extends StatefulWidget {
  TextInputType? textInputType;
  String? hint;
  String? lable;
  String? name;
  int? maxLength;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function()? onEditingComplete;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obsecureText;
  bool readOnly;
  bool enabled;
  Color? color;
  bool? filled;

  TextEditingController? controller;
  List<TextInputFormatter>? inputformtters;
  bool autoFoucs;

  MessageEditText(
      {Key? key,
      this.textInputType,
      this.obsecureText = false,
      this.readOnly = false,
      this.suffixIcon,
      this.prefixIcon,
      this.hint,
      this.lable,
      this.name,
      this.textInputAction,
      this.validator,
      this.controller,
      this.inputformtters,
      this.enabled = true,
      this.maxLength,
      this.onEditingComplete,
      this.autoFoucs = false,
      this.color,
      this.filled})
      : super(key: key);

  @override
  State<MessageEditText> createState() => _MessageEditTextState();
}

class _MessageEditTextState extends State<MessageEditText> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: widget.filled == true && widget.color != null
                  ? widget.color
                  : AppColors.offwhiteColor,
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              if (widget.prefixIcon != null)
              SizedBox(
                height: 20,
                width: 20,
                child: widget.prefixIcon,
              ),
              if (widget.prefixIcon != null)
                const VerticalDivider(
                  color: Colors.black45,
                  indent: 8,
                  endIndent: 8,
                  thickness: 1,
                ),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  validator: widget.validator,
                  onEditingComplete: widget.onEditingComplete,
                  textInputAction: widget.textInputAction,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: widget.textInputType,
                  obscureText: widget.obsecureText,
                  readOnly: widget.readOnly,
                  cursorColor: Colors.blue,
                  inputFormatters: widget.inputformtters,
                  enabled: widget.enabled,
                  maxLength: widget.maxLength,
                  autofocus: widget.autoFoucs,
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    cut: true,
                    paste: false,
                    selectAll: false,
                  ),
                  style: const TextStyle(
                    fontSize: 14, //fontFamily: KSMFontFamily.robotoRgular
                  ),
                  decoration: InputDecoration(
                      suffixIcon: widget.suffixIcon,
                      labelText: widget.lable,
                      errorStyle: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: Colors.red),
                      helperStyle: Theme.of(context).textTheme.subtitle1,
                      hintStyle: Theme.of(context).textTheme.caption,
                      hintText: widget.hint,
                      // filled: true,
                      // border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 10, right: 10),
                      label: widget.name != null ? Text(widget.name ?? "") : null,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
