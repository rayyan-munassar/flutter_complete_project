import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBoarder;
  final InputBorder? enabledBoarder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBoarder,
    this.enabledBoarder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // rebuild when focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFocused = _focusNode.hasFocus;

    return TextFormField(
      focusNode: _focusNode,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: widget.focusedBoarder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder: widget.enabledBoarder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        hintStyle: widget.hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: widget.hintText,
        // Here we inject color change
        suffixIcon: widget.suffixIcon != null
            ? IconTheme(
          data: IconThemeData(
            color: isFocused
                ? ColorsManager.mainBlue // focused color
                : ColorsManager.gray,    // default color
          ),
          child: widget.suffixIcon!,
        )
            : null,
        filled: true,
        fillColor: widget.backgroundColor ?? ColorsManager.moreLightGray,
      ),
      obscureText: widget.isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
