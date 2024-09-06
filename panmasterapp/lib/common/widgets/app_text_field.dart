import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.hintText,
    this.validator,
    this.textInputType,
    this.textEditingController,
    this.focusNode,
    this.textInputAction,
    this.autoFocus = false,
    this.enabled = true,
    this.labelText,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    this.textAlign,
    this.maxLength,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool enabled;
  final String? labelText;
  final Widget? prefixIcon;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final int? maxLength;
  final bool readOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autofocus: autoFocus,
      validator: validator,
      keyboardType: textInputType,
      style: AppFontStyle.bodyNormal16,
      textInputAction: textInputAction,
      controller: textEditingController,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: AppFontStyle.bodyNormal14.copyWith(color: AppColors.accentColor),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
      maxLength: maxLength,
      readOnly: readOnly,
      onTap: onTap,
    );
  }

}

class AppPasswordTextField extends StatelessWidget {
  AppPasswordTextField({
    Key? key,
    this.hintText,
    this.validator,
    this.textInputType,
    this.textEditingController,
    this.focusNode,
    this.textInputAction,
    this.autoFocus = false,
    this.enabled = true,
    this.labelText,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    this.textAlign,
  }) : super(key: key);

  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool enabled;
  final String? labelText;
  final Widget? prefixIcon;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;

  RxBool passwordEyeOpen = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
      enabled: enabled,
      autofocus: autoFocus,
      validator: validator,
      keyboardType: textInputType,
      style: AppFontStyle.bodyNormal16,
      textInputAction: textInputAction,
      controller: textEditingController,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: GestureDetector(
          onTap: () {
            passwordEyeOpen.value = !passwordEyeOpen.value;
            passwordEyeOpen.refresh();
          },
          child: Icon(
            passwordEyeOpen.value ? Icons.visibility : Icons.visibility_off,
            color: AppColors.accentColor,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: AppFontStyle.bodyNormal14.copyWith(color: AppColors.accentColor),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
      obscureText: !passwordEyeOpen.value,
      enableSuggestions: false,
      autocorrect: false,
    ));
  }

}