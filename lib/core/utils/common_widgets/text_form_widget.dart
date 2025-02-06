import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//ignore: must_be_immutable
class CommonTextFormField extends StatelessWidget {
  CommonTextFormField({
    super.key,
    this.textEditingController,
    this.focusNode,
    this.customInputDecoration,
    this.keyBoardType,
    this.textCapitalization,
    this.textInputAction,
    this.readOnly,
    this.obscureText,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.autovalidateMode,
    this.prefixIcon,
    this.suffixIcon,
    this.labelWidget,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.errorWidget,
    this.errorText,
    this.errorStyle,
    this.contentPadding,
    this.filledStatus,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
    this.enabledStatus,
    this.textStyle,
    this.onChangedFun,
    this.onTapFun,
    this.onEditingCompleteFun,
    this.onFieldSubmittedFun,
    this.onSavedFun,
    this.validatorFun,
    this.textFieldFormKey,
  });

  ///Text Form field properties
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final InputDecoration? customInputDecoration;
  final TextInputType? keyBoardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final bool? readOnly;
  final bool? obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final GlobalKey<FormState>? textFieldFormKey;

  ///functionality properties
  final void Function(String)? onChangedFun;
  final void Function()? onTapFun;
  final void Function()? onEditingCompleteFun;
  final void Function(String)? onFieldSubmittedFun;
  final void Function(String?)? onSavedFun;
  final String? Function(String?)? validatorFun;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;

  ///input decoration widget properties
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? labelWidget;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? errorWidget;
  final String? errorText;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool? filledStatus;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final bool? enabledStatus;

  InputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: textFieldFormKey ?? GlobalKey<FormState>(),
      controller: textEditingController ?? TextEditingController(),
      focusNode: focusNode,
      keyboardType: keyBoardType ?? TextInputType.text,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      textInputAction: textInputAction ?? TextInputAction.done,
      style: textStyle ?? Theme.of(context).textTheme.bodySmall,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      validator: validatorFun ??
          (value) {
            if (value == null || (value).isEmpty) {
              return "This Field Can't be Empty";
            }
            return null;
          },
      onChanged: onChangedFun ??
          (value) {
            debugPrint("onChanged fun called value : $value");
          },
      onTap: onTapFun ??
          () {
            debugPrint("onTap fun called");
          },
      onEditingComplete: onEditingCompleteFun ??
          () {
            debugPrint("onEdigingCompleted fun called");
          },
      onSaved: onSavedFun ??
          (value) {
            debugPrint("onSaved fun called value : $value");
          },
      decoration: customInputDecoration ??
          InputDecoration(
            prefixIcon: prefixIcon,
            suffix: suffixIcon,
            label: labelWidget,
            labelText: labelText,
            labelStyle: labelStyle ?? Theme.of(context).textTheme.bodySmall,
            hintText: hintText,
            hintStyle: hintStyle ?? Theme.of(context).textTheme.bodySmall,
            error: errorWidget,
            errorText: errorText,
            errorStyle: errorStyle ?? Theme.of(context).textTheme.bodySmall,
            contentPadding: contentPadding ?? EdgeInsets.all(12.0),
            filled: filledStatus,
            fillColor: fillColor ?? Colors.white,
            focusColor: focusColor ?? Colors.grey,
            hoverColor: hoverColor ?? Colors.grey,
            errorBorder: errorBorder ?? defaultBorder,
            focusedBorder: focusedBorder ?? defaultBorder,
            focusedErrorBorder: focusedErrorBorder ?? defaultBorder,
            disabledBorder: disabledBorder ?? defaultBorder,
            enabledBorder: enabledBorder ?? defaultBorder,
            border: border ?? defaultBorder,
            enabled: enabledStatus ?? true,
          ),
    );
  }
}
